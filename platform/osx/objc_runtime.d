module xf.platform.osx.objc_runtime;

import xf.platform.osx.objc_class;

import tango.stdc.stdlib : calloc;

extern (C) {
	SEL sel_registerName(char*);

	void objc_addClass(Class);
	Class objc_lookUpClass(char*);
	id class_createInstance(Class, uint);

	id objc_msgSend(id, SEL, ...);
	void objc_msgSend_stret(void*, id, SEL, ...);

	void class_addMethods(Class, objc_method_list*);
	void class_removeMethods(Class, objc_method_list*);

	Ivar object_getInstanceVariable(id, char*, void**);
	Ivar object_setInstanceVariable(id, char*, void*);

	void NSLog(id);
}

alias objc_msgSend send;
alias objc_msgSend_stret sends;

void registerClass(char[] name, char[] superName) {
	Class superClass = lookUp(superName);
    assert(superClass);
    assert(!lookUp(name), "objc class already exists");

    Class rootClass = superClass;
    while(cast(int)rootClass.super_class != 0) {
        rootClass = rootClass.super_class;
    }

    Class newClass = cast(Class) calloc(2, objc_class.sizeof);
    Class metaClass = &newClass[1];

    newClass.isa = metaClass;
    newClass.info = CLS_CLASS;
    metaClass.info = CLS_META;

	newClass.name = ((name~\0).dup).ptr;
    metaClass.name = newClass.name;

    newClass.methodLists = cast(objc_method_list**) calloc( 1, (objc_method_list*).sizeof );
    *(newClass.methodLists) = cast(objc_method_list*) -1;
    metaClass.methodLists = cast(objc_method_list**) calloc( 1, (objc_method_list*).sizeof );
    *(metaClass.methodLists) = cast(objc_method_list*) -1;

    newClass.super_class = superClass;
    metaClass.super_class = superClass.isa;
    metaClass.isa = rootClass.isa;

    newClass.instance_size = superClass.instance_size;
    metaClass.instance_size = metaClass.super_class.instance_size;

    objc_addClass(newClass);
    assert(lookUp(name));
}

void addVariable(id o, char[] name, char[] type, int offset) {
	objc_ivar ivar;
	ivar.ivar_name = (name ~ \0).ptr;
	ivar.ivar_type = (type ~ \0).ptr;
	ivar.ivar_offset = offset;

	if (!o.isa.ivars) {
		o.isa.ivars = cast(objc_ivar_list*) calloc (1, objc_ivar_list.sizeof);
		o.isa.ivars.ivar_count = 1;
	}
	o.isa.ivars[o.isa.ivars.ivar_count-1].ivar_list[0] = ivar;
}

SEL sel(char[] selector) {
	return sel_registerName((selector~\0).ptr);
}

Class lookUp(char[] name) {
	return objc_lookUpClass((name~\0).ptr);
}

id createInstance(Class meta, uint additionalBytes = 0) {
	return class_createInstance(meta, additionalBytes);
}

id createPool() {
	return send(createInstance(poolClass), selInit);
}

void destroyPool(id p) {
	release(p);
}

void release(id o) {
	send(o, selRelease);
}

void autorelease(id o) {
	send(o, selAutorelease);
}

id NSString(char[] str) {
	return send(cast(id)stringClass, selUtf8String, (str~\0).ptr);
}

private {
	Class poolClass;
	Class stringClass;
	SEL selInit;
	SEL selRelease;
	SEL selAutorelease;
	SEL selUtf8String;
}

static this() {
	poolClass = lookUp("NSAutoreleasePool");
	stringClass = lookUp("NSString");

	selInit = sel("init");
	selRelease = sel("release");
	selAutorelease = sel("autorelease");
	selUtf8String = sel("stringWithUTF8String:");
}
