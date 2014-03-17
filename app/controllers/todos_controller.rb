class TodosController < ApplicationController
  def index
	#@todo_item1 = "recherche et analyse"
	#@todo_item2 = "conception"
	#@todo_array = ["recherche et analyse", "conception", "validation", "developpement"]
	@todo_items = Todo.all
  end

  def delete
  	t = Todo.last
  	t.delete
  end

  def add
  	todo = Todo.create(:todo_item => params[:todo_text])
	if !todo.valid?
		flash[:error] = todo.errors.full_messages.join("<br>").html_safe
	end
  	redirect_to :action => 'index'
  end

end
