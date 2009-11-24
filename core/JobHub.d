// NOTE: investigate if IJob could be simply replaced by a plain delegate


module core.JobHub;


private {
	import util.singleton;
}



interface IJob {
	void exec();
}



class DelegateWrapper : IJob {
	this (void delegate() dg) {
		this.dg = dg;
	}
	
	void exec() {
		dg();
	}
	
	package void delegate() dg;
	
}


class FunctionWrapper : IJob {
	this (void function() fn) {
		this.fn = fn;
	}
	
	void exec() {
		fn();
	}
	
	protected void function() fn;
}



DelegateWrapper wrapDelegate(void delegate() dg) {
	return new DelegateWrapper(dg);
}


FunctionWrapper wrapFunction(void function() fn) {
	return new FunctionWrapper(fn);
}



abstract class Process : IJob
{
	abstract void exec();
	
	
	bool	stopped() {
		return stopped_;
	}
	
	
	void stop() {
		stopped_ = true;
	}
	
	
	private {
		bool stopped_ = false;
	}
}



struct ScheduledJob {
	float	timeToRun = 0.f;
	float	period;
	IJob		job;
	bool		oneShot;
	bool		newJob = true;
	int		next;
	
	int opCmp(ScheduledJob* j) {
		if (timeToRun < j.timeToRun) return -1;
		if (timeToRun > j.timeToRun) return 1;
		return 0;
	}
}



class JobHub
{
	void exec(IJob j) {
		j.exec();
	}
	
	
	void addOneShotJob(IJob j, float time = 0) {
		ScheduledJob sj;
		sj.timeToRun = time;
		sj.period = 0.f;
		sj.job = j;
		sj.oneShot = true;
		addJob(sj);
	}
	
	void removeOneShotJob(void delegate() dg){
		for(int i=0; i<scheduledJobs.length; ++i){
			auto tmp=cast(DelegateWrapper) scheduledJobs[i].job;
			if( tmp !is null){
				if(tmp.dg is dg){
					scheduledJobs[i]=scheduledJobs[$-1];
					scheduledJobs.length=scheduledJobs.length-1;
					jobsModified = true;
					return;
				}
			}
		}
		assert(false, "no such delegate registered");
	}
	
	void addOneShotJob(void delegate() dg, float time = 0) {
		return addOneShotJob(wrapDelegate(dg), time);
	}

	void addOneShotJob(void function() fn, float time = 0) {
		return addOneShotJob(wrapFunction(fn), time);
	}

	
	void addRepeatableJob(IJob j, float frequency) {
		ScheduledJob sj;
		sj.period = 1.f / frequency;
		sj.job = j;
		sj.oneShot = false;
		addJob(sj);
	}
	
	void addRepeatableJob(void delegate() dg, float frequency) {
		return addRepeatableJob(wrapDelegate(dg), frequency);
	}
	
	void removeRepeatableJob(void delegate() dg){
		for(int i=0; i<scheduledJobs.length; ++i){
			auto tmp=cast(DelegateWrapper) scheduledJobs[i].job;
			if( tmp !is null){
				if(tmp.dg is dg){
					scheduledJobs[i]=scheduledJobs[$-1];
					scheduledJobs.length=scheduledJobs.length-1;
					jobsModified = true;
					return;
				}
			}
		}
		assert(false, "no such delegate registered");
	}

	void addRepeatableJob(void function() fn, float frequency) {
		return addRepeatableJob(wrapFunction(fn), frequency);
	}

	
	void addPreFrameJob(IJob j) {
		preFrameJobs ~= j;
	}

	void addPreFrameJob(void delegate() dg) {
		return addPreFrameJob(wrapDelegate(dg));
	}

	void addPreFrameJob(void function() fn) {
		return addPreFrameJob(wrapFunction(fn));
	}


	void addPostFrameJob(IJob j) {
		postFrameJobs ~= j;
	}

	void addPostFrameJob(void delegate() dg) {
		return addPostFrameJob(wrapDelegate(dg));
	}

	void addPostFrameJob(void function() fn) {
		return addPostFrameJob(wrapFunction(fn));
	}

	
	private void addJob(inout ScheduledJob j) {
		scheduledJobs ~= j;
		jobsModified = true;
	}
		
	
	void update(float timeDelta) {
		if (0 == timeDelta) return;		
		jobsModified = false;


		foreach (j; preFrameJobs) j.exec();

		
		// fit in the frame time budget
		if (timeDelta > maxFrameTime) {
			timeDelta = maxFrameTime;
		}
		
		
		// make a queue out of the jobs that we will run
		void makeQueue() {
			scheduledJobs.sort;
			foreach (i, inout sj; scheduledJobs) {
				if (i+1 >= scheduledJobs.length || scheduledJobs[i+1].timeToRun > timeDelta) {
					sj.next = -1;
				} else {
					sj.next = i+1;
				}
			}
		}
		
		
		// otherwise the gates to hell will open.
		foreach (inout j; scheduledJobs) {
			j.newJob = false;
		}
		
		makeQueue();
		
		if (scheduledJobs.length > 0) {
			for (int cur = 0; cur != -1 && scheduledJobs[cur].timeToRun <= timeDelta; null) {
				ScheduledJob* sj = &scheduledJobs[cur];
				
				// save the execution time of the current job
				float lastRunTime = sj.timeToRun;
				
				// re-schedule the job or put it away if it's just a one-shot job
				if (sj.oneShot) sj.timeToRun = float.max;
				else sj.timeToRun += sj.period;

				// run the job. it may delete itself, other jobs or add some jobs, so watch out...
				scheduledJobs[cur].job.exec();
				
				// some jobs have been added or removed while processing them
				if (jobsModified) {
					
					// offset new jobs in time by the run time of the job that generated them
					foreach (inout j; scheduledJobs) {
						if (j.newJob) {
							j.timeToRun += lastRunTime;
							j.newJob = false;
						}
					}
					
					// regenerate the job queue
					if (scheduledJobs.length > 0) {
						makeQueue();
						cur = 0;
					} else cur = -1;
					
					// go on with processing
					continue;
				}
				
				
				if (sj.timeToRun > timeDelta) {
					// remove sj
					cur = sj.next;
				} else {
					// postpone sj
					
					// if the current job is last in the queue or the next job should be ran later, simply re-run the current job
					if (-1 == sj.next || scheduledJobs[sj.next].timeToRun > sj.timeToRun) {
						continue;
					}
					
					// move the job after some other job
					assert (sj.next != -1);
					int prev = cur;
					cur = sj.next;
					
					// find the node after which we'll insert sj/prev
					int i = cur;
					while (	scheduledJobs[i].next != -1
								&& scheduledJobs[scheduledJobs[i].next].timeToRun <= sj.timeToRun)
					{
						i = scheduledJobs[i].next;
					}
					
					// i is the job after which we'll insert sj
					sj.next = scheduledJobs[i].next;
					scheduledJobs[i].next = prev;
				}
			}
		}

		// proceed to the next time tick
		foreach (inout j; scheduledJobs) {
			if (j.timeToRun != float.max) j.timeToRun -= timeDelta;
		}
		
		// remove one-shot jobs that have already been ran
		for (int i = 0; i < scheduledJobs.length; null) {
			if (scheduledJobs[i].oneShot && scheduledJobs[i].timeToRun == float.max) {
				scheduledJobs[i] = scheduledJobs[$-1];
				scheduledJobs.length = scheduledJobs.length - 1;
			} else {
				++i;
			}
		}
		
		
		foreach (j; postFrameJobs) j.exec();
	}


	private {
		ScheduledJob[]					scheduledJobs;
		IJob[]								preFrameJobs;
		IJob[]								postFrameJobs;
		bool									jobsModified = false;
	}
	
	public {
		float	maxFrameTime = 0.3f;
	}
}


alias Singleton!(JobHub) jobHub;
