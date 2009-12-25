module pattern.depinjection.interceptor;

interface Interceptor {
	void intercept(ref void[] obj, TypeInfo type);
}
