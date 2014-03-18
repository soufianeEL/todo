class TodosController < ApplicationController

  def index
  	#@todo_item1 = "recherche et analyse"
  	#@todo_array = ["recherche et analyse", "conception", "validation", "developpement"]
  	@todo_items = Todo.all
  	@new_todo = Todo.new
  end


  def delete
  	t = Todo.last
  	t.delete
  end


  def add
  	todo = Todo.create(:todo_item => params[:todo][:todo_item])
    unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
     	flash[:success] = "Todo added successfully"
    end

  	redirect_to :action => 'index'
  end

  def complete
    params[:todos_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      if t.completed == true
        t.update_attribute(:completed, false)
      else
        t.update_attribute(:completed, true)
      end
    end
    redirect_to :action => 'index'
  end

end
