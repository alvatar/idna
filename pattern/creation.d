module pattern.creation;

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Add static creation to classes
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
template StaticCreation() {

	static typeof(this) create() {
		return new typeof(this);
	}
}

/++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + Singleton pattern drop-in
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
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

