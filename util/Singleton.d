module util.Singleton;



T Singleton(T)() {
	static T singletonInstance;
	
	synchronized (T.classinfo) if (singletonInstance is null) {
		singletonInstance = new T;
		static if (is(typeof(singletonInstance.initialize))) {
			singletonInstance.initialize();
		}
	}

	return singletonInstance;
}
