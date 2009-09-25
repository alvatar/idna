module idna.tools.Curry;

void delegate() Curry(Args...)(void delegate(Args) dg, Args args) {
    struct Closure {
        Args arguments;
        void delegate(Args) callee;
        void call() {
            callee(arguments);
        }
    }
    
    auto c = new Closure;
    foreach(i,a;args) {     // LDC currently errors on a direct tuple assignment
        c.arguments[i] = a;
	}
    c.callee = dg;
    return &c.call;
}
