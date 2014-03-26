package todo;
import knockout.Knockout;
import knockout.ObservableArray;
@:keep
class Model {

    private var storage:LocalStorage;
    public var todoList(default, null):ObservableArray<Todo>;

    public function new(storage:LocalStorage) {
        this.storage = storage;
        todoList = Knockout.observableArray();
    }

    public function addTodo(summary:String, done:Bool):Void {
        todoList.push(new Todo(summary, done));
    }

    public function deleteTodo(todo:Todo):Void {
        todoList.remove(todo);
    }

    public function archive():Void {
        todoList.remove(function(todo:Todo) {
            return todo.done.get();
        });
    }

    public function save():Void {

    }

    public function load():Void {

    }

}

