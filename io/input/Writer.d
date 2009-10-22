module io.input.Writer;

version(Windows) {
	public import io.input.writer.Win32 : OSInputWriter = Win32InputWriter;
} else {
	public import io.input.writer.X : OSInputWriter = XInputWriter;
}
