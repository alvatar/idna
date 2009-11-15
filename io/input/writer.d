module io.input.writer;

version(Windows) {
	public import io.input.writers.win32 : OSInputWriter = Win32InputWriter;
} else {
	public import io.input.writers.x : OSInputWriter = XInputWriter;
}
