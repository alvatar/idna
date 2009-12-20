module cyma.controller.commands.EnginePlugin;

private {
	import std.string;

	import cyma.controller.InteractiveCommand;
	import sys.SharedLib;
}

class EnginePlugin : InteractiveCommand!(string) {

	private {
		SharedLib _plugin;
		//bool _loaded = false;
		//void plugin_main();
		static Object _loaderMutex;
	}

	this( Ui ui ) {
		if (_loaderMutex is null) _loaderMutex = new Object;
		super(ui);
	}

	override void execute( ref Model model ) {
		interactiveSequence( model );
	}

	override void revert( ref Model model ) {
	}

	override void interactiveSequence( ref Model model ) {
		//context = MakeContext("load");
		loadPlugin();
	}

	private:
	import std.stdio;
	void unloadPlugin() {
		if( _plugin !is null ) {
			_plugin.unload();
			_plugin = null;
		}
	}

	void loadPlugin() {
		synchronized( _loaderMutex ) {
			bool loadLibrary( string src ) {
				if( _plugin !is null )
					unloadPlugin();
				try {
					_plugin = SharedLib.load(src);
					return _plugin !is null;
				} catch (SharedLibException) {
					writeln("PEDO");
					return false;
				}
			}
			void* loadFunction(ref SharedLib lib, string name) {
				void* func = lib.getSymbol( cast(char*)toStringz(name.dup) );
				if (func is null) {
					//TODO
					//handleMissingProc(name);
					return null;
				} else return func;
			}
			void load(string libraryName, void delegate() loadDg) {
				string[] libSearchPaths = [""];
				foreach (path; libSearchPaths) {
					if( !path.length ) {
						if( loadLibrary(libraryName) ) {
							loadDg();
							return;
						} else continue;
					}
					/*
					auto rootPath = basename(path);
					if (exists(path) && isdir(path)) {
						foreach (filePath; listdir(rootPath)) {
							try {
								if (isdir(filePath)) continue;
							} catch {
								continue;
							}
							if( fnmatch(filePath, name) ) {
								if (loadLibrary(path.join(path, filePath))) {
									loadFunc();
									return;
								} else continue;
							}
						}
					}
					*/
				}
				//handleLibNotFound(namesList, libSearchPaths);
			}

			load( "engine_plugin.so", (){ loadFunction(_plugin,"plugin_main"); } );
		}
	}

	void executePlugin() {
	}
}
