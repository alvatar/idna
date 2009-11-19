module io.input.Writer;

version(Windows) {
	public import io.input.writer.win32 : OSInputWriter = Win32InputWriter;
} else {
	public import io.input.writer.x : OSInputWriter = XInputWriter;
}
