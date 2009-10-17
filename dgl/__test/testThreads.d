module xf.dog.testThreads;

import xf.dog.Dog;
import xf.omg.core.LinearAlgebra : vec2i;
import tango.core.Thread;
import tango.io.Stdout;
import xf.utils.Bind;



void draw(GL gl, float r, float g, float b, float rot) {
	gl.Clear(GL_COLOR_BUFFER_BIT);
	gl.Rotatef(rot, 0, 0, 1);

	gl.Color3f(r, g, b);
	gl.immediate(GL_TRIANGLES, {
		gl.Vertex3f(-1,  -1,   -2);
		gl.Vertex3f(1,   -1,   -2);
		gl.Vertex3f(0,    1,   -2);
	});
}


void setupGL(GL gl) {
	gl.MatrixMode(GL_PROJECTION);
	gl.LoadIdentity();
	gl.gluPerspective(90.f, 1.333f, 0.1f, 100.f);
	gl.MatrixMode(GL_MODELVIEW);
	gl.LoadIdentity();
}



void threadFunc(char[] title, int x, int y, float r, float g, float b, float rot) {
	//try {
		auto context = GLWindow();
		context
			.title(title)
			.position(vec2i(x, y))
			.width(320)
			.height(240)
		.create();
		
		use (context) in &setupGL;
		
		while (context.created) {
			use(context) in bind(&draw, _0, r, g, b, rot).ptr();
			context.update().show();
			Thread.getThis.yield();
		}
	/+} catch (Exception e) {
		Stdout.formatln(`Error in {}: {} in {} at {}`, title, e.toString, e.file, e.line);
	}+/
	
	Stdout.formatln(`Thread exiting`);
}


void main() {
	(new Thread(bind(&threadFunc, `Window 1`, 0, 0, 1.f, 0.f, 0.f, .5f).ptr)).start();
	(new Thread(bind(&threadFunc, `Window 2`, 150, 150, 0.f, 1.f, 0.f, -.5f).ptr)).start();
	(new Thread(bind(&threadFunc, `Window 3`, 300, 300, 0.f, 0.f, 1.f, 1.f).ptr)).start();
	(new Thread(bind(&threadFunc, `Window 4`, 450, 450, 1.f, 1.f, 0.f, -1.f).ptr)).start();

	thread_joinAll();
}
