package;
// source/FlxSignal.hx
// Fix for FlxTypedSignal / FlxSignal missing in Flixel 0.6.3 + Haxe 4.3

class FlxSignal<T> {
    public var listeners:Array<T->Void>;

    public function new() {
        listeners = [];
    }

    public function add(listener:T->Void):Void {
        listeners.push(listener);
    }

    public function remove(listener:T->Void):Void {
        var index = listeners.indexOf(listener);
        if (index >= 0) listeners.splice(index, 1);
    }

    public function dispatch(value:T):Void {
        for (listener in listeners) {
            listener(value);
        }
    }
}

// Alias old FlxTypedSignal to new FlxSignal
typedef FlxTypedSignal<T> = FlxSignal<T>;
