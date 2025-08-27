package compat;

class MainLoopCompat {
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

    public static inline function addWithDt(cb:Float->Void):Void {
        #if (haxe_ver >= 4.3)
        haxe.MainLoop.add(function():Float {
            cb(0.0);
            return 0.0;
        });
        #else
        haxe.MainLoop.add(function() cb());
        #end
    }
}
