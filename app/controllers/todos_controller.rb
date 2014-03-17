class TodosController < ApplicationController
  def index
	#@todo_item1 = "recherche et analyse"
	#@todo_item2 = "conception"
	#@todo_array = ["recherche et analyse", "conception", "validation", "developpement"]
	@todo_items = Todo.all
  end
end
