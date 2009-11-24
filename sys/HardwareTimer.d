module sys.HardwareTimer;


private {
	import util.singleton;
	import sys.StopWatch;
}



/**
	DO NOT USE FOR REGULAR TIMING!  See >> core.Timer <<
*/
class HardwareTimer {
	private final void getTimeAndDiff(out long time, out long diff) {
		time = stopWatch.microsec();
		diff = cast(long)(cast(real)(time - lastReading) * this.mult);
	}
	
	
	final ulong timeDeltaMicros() {
		long time, diff;
		getTimeAndDiff(time, diff);

		if (diff > 0) {
			lastReading = time;
			virtualTime += diff;
			return diff;
		} else {
			return 0;
		}
	}
	
	
	final ulong timeMicros() {
		long time, diff;
		getTimeAndDiff(time, diff);
		
		if (diff > 0) {
			lastReading = time;
			virtualTime += diff;
		}
		
		return virtualTime;
	}
	
	
	final void micros_Time_TimeDelta(out long outTime, out long outTimeDelta) {
		long time, diff;
		getTimeAndDiff(time, diff);
		
		if (diff > 0) {
			lastReading = time;
			virtualTime += diff;
			outTimeDelta = diff;
		} else {
			outTimeDelta = 0;
		}

		outTime = virtualTime;
	}
	
	
	static void multiplier(double m) {
		this.mult = m;
	}


	static double multiplier() {
		return this.mult;
	}


	this() {
		stopWatch.start();
	}


	private {
		StopWatch stopWatch;
		long lastReading = 0;
		long virtualTime = 0;
		static double mult = 1.0;
	}
}


// BUG: not thread safe. probably each thread needs its own timer
alias Singleton!(HardwareTimer)	hardwareTimer;
