package todo;
import knockout.Knockout;
import knockout.Observable;
@:keep
class Todo {

    public var summary(default, default):String;
    public var done(default, null):Observable<Bool>;

    public function new(summary:String, done:Bool) {
        this.summary = summary;
        this.done = Knockout.observable(done);
    }

    public function toPlainObject():Dynamic {
        return {
        summary: summary,
        done: done.get()
        };
    }
}
