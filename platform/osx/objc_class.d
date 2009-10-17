//for documentation use Objective-C Runtime Reference document

module xf.platform.osx.objc_class;

struct objc_class {
	objc_class* isa;
	objc_class* super_class;

	char* name;
	int _version;
	int info;
	int instance_size;
	objc_ivar_list* ivars;

	objc_method_list** methodLists;

	objc_cache* cache;
	objc_protocol_list* protocols;
}

struct objc_object {
	objc_class* isa;
}

struct objc_ivar {
    char *ivar_name;
    char *ivar_type;
    int ivar_offset;
}
alias objc_ivar* Ivar;

struct objc_ivar_list {
    int ivar_count;
	objc_ivar[1] ivar_list;
}

alias objc_object* id;
alias char* SEL;
alias id function(id, SEL, ...) IMP;

struct objc_method {
	SEL method_name;
	char* method_types;
	IMP method_imp;
}

struct objc_method_list {
	objc_method_list* obsolete;
	int method_count;
	objc_method[1] method_list;
}

alias objc_method* Method;

struct objc_cache {
	uint mask;
	uint occupied;
	Method buckets[0];
}

alias objc_object Protocol;

struct objc_protocol_list {
	objc_protocol_list* next;
	int count;
	Protocol*[0] list;
}

enum {
	CLS_CLASS = 0x1,
	CLS_META = 0x2,
}

enum : byte {
	NO = 0,
	YES = 1,
}

alias objc_class* Class;
static const id nil = cast(id) 0;
static const id Nil = cast(id) 0;
