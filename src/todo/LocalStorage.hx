package todo;

@:native("localStorage")
extern
class LocalStorage {

public function new() {}

public inline static function get():LocalStorage{
    return untyped __js__('localStorage');
}

public function setItem(key:String, data:String):Void;

public function getItem(key:String):String;
}
