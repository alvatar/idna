module pattern.dconstructor.interceptor;

interface Interceptor
{
	void intercept(ref void[] obj, TypeInfo type);
}
