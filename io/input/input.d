module io.input.input;

private {
	import io.input.KeySym;

	struct vec2i {
		int x;
		int y;
	}

	import util.container.LinkedList;
}

public {
	alias io.input.KeySym.KeySym KeySym;
}

class InputQueue {
   abstract void sendOne(InputReader);
   abstract void removeOne();
}

class InputQueueT(T) : InputQueue {
	//alias LinkedList!(T) Queue; //SHIT!
	alias T[] Queue;
	Queue queue;

	this() {
		//queue = new Queue;
	}
   
   
	override void sendOne(InputReader reader) {
		//T input = queue.get(0);
		T input = queue[0];
		reader.process_(T.inputTypeId, (cast(ubyte*)&input)[0 .. T.sizeof]);
	}


	override void removeOne() {
		//queue.removeHead();
		queue = queue[1..$];
	}


	static InputQueue produce() {
		return new typeof(this);
	}


	final void addOne(T x) {
		//queue.append(x);
		queue ~= x;
	}
}


int lastInputId = 0;
InputQueue function()[]	inputQueueFactories;


template MInput() {
	static int inputTypeId;
   
	static this() {
   		inputTypeId = lastInputId++;
		inputQueueFactories ~= &InputQueueT!(typeof(this)).produce;
	}
}

struct KeyboardInput {

	enum Type {
		Down,
		Up
	}
	
	enum Modifiers {
		NONE 	= 0x0000,
		LSHIFT	= 0x0001,
		RSHIFT	= 0x0002,
		LCTRL	= 0x0040,
		RCTRL	= 0x0080,
		LALT	= 0x0100,
		RALT	= 0x0200,
		LMETA	= 0x0400,
		RMETA	= 0x0800,
		NUM		= 0x1000,
		CAPS	= 0x2000,
		MODE	= 0x4000,
	
		CTRL	= LCTRL | RCTRL,
		SHIFT	= LSHIFT | RSHIFT,
		ALT		= LALT | RALT,
		META	= LMETA | RMETA
	}
	
	Modifiers modifiers;
	KeySym keySym;
	dchar unicode;
	Type type;
	
	mixin MInput;
}


struct MouseInput {

	enum Button {
		Left = 1,
		Middle = 2,
		Right = 4,
		WheelUp	= 8,
		WheelDown = 16,
		WheelLeft = 32,
		WheelRight = 64,
	}

	enum Type {
		Move,
		ButtonUp,
		ButtonDown
	}

	vec2i position;
	vec2i move;
	vec2i global;
	Button buttons;
	Type type;

	mixin MInput;
}


bool isWheelInput(MouseInput.Button bttn) {
	switch (bttn) {
		case MouseInput.Button.WheelUp:
		case MouseInput.Button.WheelDown:
		case MouseInput.Button.WheelLeft:
		case MouseInput.Button.WheelRight:
			return true;
		default:
			return false;
	}
}


struct JoystickInput {
	float[6] axes;
	uint buttons;
	int pov;
	mixin MInput;
}


struct TimeInput {
	ulong micros;
	
	mixin MInput;
}


class InputReader {

	this() {
		typeReaders.length = lastInputId;
	}
	
	
	void process(int inputType, ubyte[] input) {
		// do some additional checking
		
		assert (handlesInput(inputType));
		process_(inputType, input);
	}
   

	bool handlesInput(int inputType) {
		return( inputType >= 0
				&& inputType < typeReaders.length
				&& typeReaders[inputType] !is null );
	}

   
	protected {
		void process_(int inputType, ubyte[] input) {
			assert (input !is null);
			
			if (typeReaders[inputType] !is null) {
				typeReaders[inputType](input.ptr);
			}
		}


		void delegate(void*)[] typeReaders;
		
		final void registerReader(T)(void delegate(T*) rdr) {
			assert (rdr !is null);
			typeReaders[T.inputTypeId] = cast(void delegate(void*))rdr;
		}
	}
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + SimpleKeyboardReader
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class SimpleKeyboardReader : InputReader {
	
	private {
		bool[KeySym] keyState;
	}

	this(InputChannel channel) {
		registerReader!(KeyboardInput)(&this.keyInput);
		channel.addReader(this);
	}

	void keyInput(KeyboardInput* i) {
		if( i.type.Down == i.type ) {
			keyState[i.keySym] = true;
		} else {
			keyState[i.keySym] = false;
		}
	}
	
	bool keyDown(KeySym sym) {
		if (auto k = sym in keyState) return *k;
		else return false;
	}
	
	void setKeyState(KeySym sym, bool state) {
		if (state) {
			keyState[sym] = true;
		} else {
			if (auto k = sym in keyState) {
				*k = false;
			}
		}
	}
}

/+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 + QueueKeyboardReader: keeps the keystrokes stored in order, so they can be
 + extracted
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/
class QueueKeyboardReader : InputReader {
	
	private {
		alias KeyboardInput[] InputQueue;
		InputQueue _inputQueue;
	}

	this( InputChannel chan ) {
		registerReader!(KeyboardInput)(&this.keyInput);
		chan.addReader(this);
	}
	
	void keyInput( KeyboardInput* i ) {
		if( i.type == KeyboardInput.Type.Down ) {
			_inputQueue ~= *i;
		}
	}
	
	bool keyDown(KeySym sym) {
		foreach( q; _inputQueue ) {
			if( q.keySym == sym ) return true;
		}
		return false;
	}

	InputQueue getInputQueue() {
		return _inputQueue;
	}

	uint queueLength() {
		return _inputQueue.length;
	}

	void consume() {
		_inputQueue.length = 0;
	}
}


/+class MouseReader : InputReader {
	void foo(MouseInput* i) {
		// do anything with the input
//		writefln("got a mouse input, button = ", i.button);
	}
   
   
	this() {
		registerReader!(MouseInput)(&this.foo);
	}
}


class TimeReader : InputReader {
	void foo(TimeInput* i) {
		// do anything with the input
		//("got a time tick: ", i.tick);
	}
	
	
	this() {
		registerReader!(TimeInput)(&this.foo);
	}
}+/


class InputChannel {
	
	private {
		InputQueue[] queues;
		//LinkedList!(int) queueIndices;
		int[] queueIndices;
		
		InputReader[] readers;
	}

	this() {
		//queueIndices = new LinkedList!(int);
		queues.length = lastInputId;
		foreach (i, ref q; queues) {
			q = inputQueueFactories[i]();
		}
	}

	void addReader(InputReader r) {
		readers ~= r;
	}
	
	void opBinary(string s, T)(T newInput) if (s == "<<") {
		//queueIndices.append(newInput.inputTypeId);
		queueIndices ~= newInput.inputTypeId;
		getQueue!(T)(newInput.inputTypeId).addOne(newInput);
	}
	
	bool empty() {
		//return queueIndices.isEmpty;
		return (queueIndices.length == 0);
	}
	
	void dispatchOne() {
		//int qi = queueIndices.removeHead();
		int qi = queueIndices[0];
		queueIndices = queueIndices[1..$];
		//
		InputQueue q = queues[qi];
		foreach (reader; readers) {
			q.sendOne(reader);
		}
		q.removeOne();
	}

	void dispatchAll() {
		while (!empty) {
			dispatchOne();
		}
	}

	private InputQueueT!(T) getQueue(T)(int i) {
		return cast(InputQueueT!(T))queues[i];
	}
}


class InputConverter {
	InputChannel incoming;
	InputChannel outgoing;
	
	
	this(InputChannel incoming) {
		this.incoming = incoming;
		outgoing = new InputChannel;
	}
	
	
	void dispatchOne() {
		incoming.dispatchOne();
		outgoing.dispatchOne();
	}
	
	
	bool empty() {
		return incoming.empty;
	}
   
   // arbitary readers and writers connected to channels, readers from 'incoming' will write to 'outgoing'
}





/+void main() {
	InputChannel channel = new InputChannel;

	KeyboardInput kinput;
	kinput.key = 'w';	

	MouseInput minput;
	minput.button = 2;

	TimeInput tinput;
	tinput.tick = 123456789;

	KeyboardReader keyboard = new KeyboardReader;
	MouseReader mouse = new MouseReader;
	TimeReader timer = new TimeReader;
	PlayerReader player = new PlayerReader;

	channel.readers ~= keyboard;
	channel.readers ~= mouse;
	channel.readers ~= timer;

	channel << kinput;
	channel << tinput;
	channel << minput;

	while (!channel.empty) {
		channel.dispatchOne();
	}



	auto playerMap = new PlayerInputMap;
	playerMap.outgoing.readers ~= player;
	playerMap.incoming << minput;
	playerMap.incoming << kinput;


	while (!playerMap.empty) {
		playerMap.dispatchOne();
	}
}+/

