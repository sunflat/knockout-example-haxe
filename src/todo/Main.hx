package todo;
import knockout.Knockout;

class Main {

    public static function main() {
        var storage = LocalStorage.get();
        var model = new Model(storage);
        model.addTodo('learn knockout', true);
        var viewModel = new ViewModel(model);

        Knockout.applyBindings(viewModel);
    }

    public function new() {
    }
}
