module cyma.controller.commands.EnginePlugin;

private {
	import std.string;

	import cyma.controller.Command;
	import sys.SharedLib;
}

class EnginePlugin : ContextualizedCommand!(string) {

	private {
		SharedLib _plugin;
		alias int function() PluginMainType;
		extern(System) PluginMainType _plugin_main;
		static Object _loaderMutex;
	}

	this( EnvironmentProbe environment, OutputActor output ) {
		if (_loaderMutex is null) _loaderMutex = new Object;
		_environment = environment;
		_output = output;
	}

	override bool execute( ref Model model ) {
		loadPlugin();
		executePlugin();
		unloadPlugin();
		return true;
	}

	override void revert( ref Model model ) {
	}

	private:

	void executePlugin() {
		if( _plugin_main !is null )
			_plugin_main();
	}

	import std.stdio;
	import std.path;
	import std.file;
	void loadPlugin() {
		synchronized( _loaderMutex ) {
			bool loadLibrary( string src ) {
				if( _plugin !is null )
					unloadPlugin();
				try {
					_plugin = SharedLib.load(src);
					return _plugin !is null;
				} catch (SharedLibException) {
					writeln("Plugin " ~ src ~ " not found");
					return false;
				}
			}
			void* loadFunction(ref SharedLib lib, string name) {
				void* func = lib.getSymbol( cast(char*)toStringz(name.dup) );
				if (func is null)
					writeln("The plugin doesn't have the function plugin_main defined");
				return func;
			}
			void load(string libraryName, void delegate() loaderDg) {
				string[] libSearchPaths = [];
				libSearchPaths ~= getcwd();
				foreach( path; libSearchPaths ) {
					auto fullpath = std.path.join( path, libraryName );
					if( loadLibrary(fullpath) )
						loaderDg();
				}
			}

			load( "engine_plugin.so", (){ _plugin_main = cast(PluginMainType)loadFunction(_plugin,"plugin_main"); } );
		}
	}

	void unloadPlugin() {
		if( _plugin !is null ) {
			_plugin.unload();
			_plugin = null;
			_plugin_main = null;
		}
	}
}
