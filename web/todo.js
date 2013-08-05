(function () { "use strict";
var todo = {}
todo.Main = function() { }
todo.Main.main = function() {
	var storage = localStorage;
	var model = new todo.Model(storage);
	model.addTodo("learn knockout",true);
	var viewModel = new todo.ViewModel(model);
	ko.applyBindings(viewModel);
}
todo.Model = function(storage) {
	this.storage = storage;
	this.todoList = ko.observableArray();
};
todo.Model.prototype = {
	load: function() {
	}
	,save: function() {
	}
	,archive: function() {
		this.todoList.remove(function(todo) {
			return todo.done();
		});
	}
	,deleteTodo: function(todo) {
		this.todoList.remove(todo);
	}
	,addTodo: function(summary,done) {
		this.todoList.push(new todo.Todo(summary,done));
	}
}
todo.Todo = function(summary,done) {
	this.summary = summary;
	this.done = ko.observable(done);
};
todo.Todo.prototype = {
	toPlainObject: function() {
		return { summary : this.summary, done : this.done()};
	}
}
todo.ViewModel = function(model) {
	var _g = this;
	this.model = model;
	this.todoList = model.todoList;
	this.todoSummary = ko.observable("");
	this.canAddTodo = ko.computed(function() {
		return _g.todoSummary().length > 0;
	});
	this.deleteTodo = $bind(model,model.deleteTodo);
	this.save = $bind(model,model.save);
	this.archive = $bind(model,model.archive);
};
todo.ViewModel.prototype = {
	hideTodo: function(elem) {
		if(elem.nodeType == 1) new $(elem).slideUp(null,null,function() {
			new $(elem).remove();
		});
	}
	,showTodo: function(elem) {
		if(elem.nodeType == 1) new $(elem).hide().slideDown();
	}
	,addTodo: function() {
		if(this.canAddTodo()) this.model.addTodo(this.todoSummary(),false);
	}
}
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; };
todo.Main.main();
})();

//@ sourceMappingURL=todo.js.map