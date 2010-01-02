module sys.opcodes;

void opcode_break() {
	asm {

		int 0b_0000_0011; // (int 3) Trace/breakpoint trap

	}
}

