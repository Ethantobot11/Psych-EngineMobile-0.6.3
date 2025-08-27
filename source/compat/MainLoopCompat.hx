package compat;

class MainLoopCompat {
    /**
     * Flixel/OpenFL/Lime on newer Haxe expect functions that return Float.
     * Older code passes Void->Void.
     * Use this adaptor everywhere you previously did MainLoop.add(cb).
     */
    public static inline function add(cb:Void->Void):Void {
        #if (haxe_ver >= 4.3)
        // Newer Haxe std expects a Float return (delta), so return 0.
        haxe.MainLoop.add(function():Float {
            cb();
            return 0.0;
        });
        #else
        haxe.MainLoop.add(cb);
        #end
    }

    public static inline function addWithDt(cb:Float->Void):Void {
        #if (haxe_ver >= 4.3)
        haxe.MainLoop.add(function():Float {
            // If you don't have actual dt handy, call with 0 to preserve behavior.
            cb(0.0);
            return 0.0;
        });
        #else
        // Older signatures ignore return and sometimes didn’t pass dt anyway
        haxe.MainLoop.add(function() cb());
        #end
    }
}
