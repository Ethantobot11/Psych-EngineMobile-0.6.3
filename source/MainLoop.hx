package;

// source/MainLoop.hx
// Replaces haxe.MainLoop for 0.6.3 compatibility with Haxe 4.3+
class MainLoop {
    /**
     * Add a callback to the main loop.
     * Old code: cb:Void->Void
     * New Haxe 4.3+: expects Float->Float
     */
    public static inline function add(cb:Void->Void):Void {
        #if (haxe_ver >= 4.3)
        haxe.MainLoop.add(function():Float {
            cb();
            return 0.0;
        });
        #else
        haxe.MainLoop.add(cb);
        #end
    }

    /**
     * Add a callback with delta time (dt)
     */
    public static inline function addWithDt(cb:Float->Void):Void {
        #if (haxe_ver >= 4.3)
        haxe.MainLoop.add(function():Float {
            cb(0.0); // no real dt, keep compatibility
            return 0.0;
        });
        #else
        haxe.MainLoop.add(function() cb());
        #end
    }
}
