// Author: Leonard Dahlmann 
module ThreadPool;


import tango.core.Traits;
import tango.core.Thread;
import tango.core.sync.Mutex;
import tango.core.sync.Condition;
import tango.util.log.Trace;

import gen.FreeList;
import LinkedList;

final class ThreadPool
{
private:
	static class Runnable
	{
		mixin MFreeList;
		mixin MLinkedList!(Runnable);
		
		void delegate() dg;
	}

	Runnable.LinkedList queue;
	Mutex mutex;
	Condition condition;
	Worker[] threads;

	final class Worker : Thread
	{
		bool stop = false;
		bool finished = false;
		
		this()
		{
			super(&run);
		}
		
		void run()
		{
			try
			{
				while(!stop)
				{
					Runnable task;
					
					synchronized(mutex)
					{
						while(!stop && queue.empty)
							condition.wait();
						
						if(!stop)
						{
							assert(queue.first !is null);
							task = queue.detach(queue.first);
						}
					}
					
					if(stop)
						break;

					task.dg();

					synchronized(Runnable.classinfo)
						task.free();
				}

				finished = true;
			}
			catch(Exception exception)
			{
				Trace.formatln("thread pool worker, exception: {} : {} @ {}", exception, exception.file, exception.line);
			}
		}
	}
	
public:
	this(uint numThreads)
	{
		mutex = new Mutex;
		condition = new Condition(mutex);
		
		for(uint i = 0; i < numThreads; i++)
			threads ~= new Worker;
		
		foreach(thread; threads)
		{
			thread.start();
			assert(!thread.finished);
		}
	}
	
	void dispose()
	{
		while(!queue.empty)
			Thread.sleep(0);
		
		foreach(thread; threads)
			thread.stop = true;

		outer: while(true)
		{
			synchronized(mutex)
				condition.notifyAll();
			
			foreach(thread; threads)
				if(!thread.finished) continue outer;
				
			break;
		}
		
		debug foreach(thread; threads)
			assert(thread.finished);
		
		Runnable.freeAll();
	}
	
	void exec(void delegate() dg)
	{
		Runnable task;
		
		synchronized(Runnable.classinfo)
			task = Runnable.allocate();
		
		synchronized(mutex)
		{
			task.dg = dg;
			
			queue.attach(task);
			condition.notify();
		}
	}
}

struct Future(T, P...)
{
private:
	alias T delegate(P) dg_t;
	dg_t dg;

	T _result;
	P params;
	
	bool finished;
	
	void run()
	{
		_result = dg(params);
		finished = true;
	}
	
public:
	void opCall(ThreadPool threadPool, dg_t d, P p)
	{
		dg = d;
		params = p;
		finished = false;
		
		threadPool.exec(&run);
	}
	
	T result()
	{
		while(!finished)
			Thread.sleep(0);
			
		return _result;
	}
}

/*struct PoolApply(T)
{
	alias ParameterTupleOf!(ParameterTupleOf!(typeof(T.opApply))[0]) ParamTuple;

	
	T data;
	
	Future!(int, T)[] workers;
	uint workersUsed = 0;

	int opApply(int delegate(T) dg)
	{
		workersUsed = 0;
		
		foreach(element; data)
		{
			workersUsed++;
			
			if(workersUsed < workers.length)
				workers.length = workersUsed;
			
			workers[$ - 1](dg, element);
		}
		
		foreach(worker; workers)
			worker.result();
		
		return 0;
	}
}

PoolApply!(T) poolApply(T)(T data)
{
	PoolApply!(T) result;
	result.data = data;
	
	return result;
}*/

version(RunUnitTests)
	import tango.util.log.Trace;

unittest
{
	auto threadPool = new ThreadPool(4);
	scope(exit) threadPool.dispose();
	
	int k;
	const num = 100;
	
	for(int i = 0; i < num; i++)
		threadPool.exec({ ++k; });
	
	Future!(int, int) future1;
	Future!(int, int) future2;
	Future!(int, int) future3;
	
	int func(int x)
	{
		return 3 * x;
	}
	
	future1(threadPool, &func, 2);
	future2(threadPool, &func, 3);
	future3(threadPool, &func, 4);
	
	assert(future1.result == 6);
	assert(future2.result == 9);
	assert(future3.result == 12);

	assert(k == num);
}
