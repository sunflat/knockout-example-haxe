package todo;
import knockout.DependentObservable;
import knockout.Knockout;
import jQuery.JQuery;
import js.html.Element;
import knockout.Observable;
import knockout.ObservableArray;
@:keep
class ViewModel {

    private var model:Model;
    public var todoList(default, null):ObservableArray<Todo>;
    public var todoSummary(default, default):Observable<String>;
    public var canAddTodo(default, null):DependentObservable<Bool>;

    public var deleteTodo:Todo -> Void;
    public var save:Void -> Void;
    public var archive:Void -> Void;

    public function new(model:Model) {
        this.model = model;
        this.todoList = model.todoList;
        this.todoSummary = Knockout.observable('');
        this.canAddTodo = Knockout.computed(function() {
            return todoSummary.get().length > 0;
        });

        this.deleteTodo = model.deleteTodo;
        this.save = model.save;
        this.archive = model.archive;
    }

    public function addTodo():Void {
        if (canAddTodo.get()) {
            model.addTodo(todoSummary.get(), false);
        }
    }

    public function showTodo(elem:Element):Void {
        if (elem.nodeType == 1) {
            new JQuery(elem).hide().slideDown();
        }
    }

    public function hideTodo(elem:Element):Void {
        if (elem.nodeType == 1) {
            new JQuery(elem).slideUp(function() {
                new JQuery(elem).remove();
            });
        }
    }

}
