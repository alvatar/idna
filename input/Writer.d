module input.Writer;

version(Windows) {
	public import input.writer.Win32 : OSInputWriter = Win32InputWriter;
} else {
	public import input.writer.X : OSInputWriter = XInputWriter;
}
