module pattern.depinjection.tracedexception;

private {
	import pattern.depinjection.stack;
	import pattern.depinjection.exception;
}

void buildexception (char[] message, BuildStack stack, TypeInfo type)
in {
	assert (type !is null, "error building nothing?");
} body {
	auto targets = stack.targets;
	auto top = (targets.length ? targets[0] : type);
	string msg = "Could not instantiate type " ~ top.toString ~ ". Error was: could not build ";
	if (targets.length > 1) {
		foreach (target; targets) {
			msg ~= `type ` ~ target.toString ~ " which it is waiting for dependencies:\n";
		}
	}
	msg ~= `type ` ~ type.toString ~ ":\n";
	msg ~=  message;
	throw new BindingException(msg);
}
