package compat;

#if (flixel)
package flixel.util;

// Minimal stub for FlxSignal (newer Flixel removed it)
class FlxSignal {
    private var callbacks:Array<Void->Void> = [];

    public function new() {}

    public function add(cb:Void->Void):Void {
        if (cb != null && callbacks.indexOf(cb) == -1) callbacks.push(cb);
    }

    public function remove(cb:Void->Void):Void {
        callbacks.remove(cb);
    }

    public function dispatch():Void {
        for (cb in callbacks) cb();
    }
}

// Alias the old FlxTypedSignal to our stub
typedef FlxTypedSignal = FlxSignal;

#end
