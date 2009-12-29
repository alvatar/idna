module dgl.window;

interface Window {
	string title();
	Window	title(string t);
	
	Window	decorations(bool d);
	bool		decorations();
	
	Window	showCursor(bool);

	Window	fullscreen(bool f);
	bool		fullscreen();
	
	struct vec2i {
		int x;
		int y;
	}

	Window	position(vec2i);
	vec2i	position();
	
	bool		visible();
	Window	update();
}
