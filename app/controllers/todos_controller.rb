class TodosController < ApplicationController

  def show
    flash.notice = "from show"
    redirect_to :action => 'index'
  end

  def index
  	#@todo_item1 = "recherche et analyse"
  	#@todo_array = ["recherche et analyse", "conception", "validation", "developpement"]
  	@todo_items = Todo.all
    flash.notice = "from index "
    puts "**********" * 5
    puts params.inspect
    if !params[:todo].nil?
      @todo = params[:todo]
    else
    @todo = Todo.new
    end
  end


  def delete
  	t = Todo.last
  	t.delete
    redirect_to :action => 'index'
  end


  def create
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

  def edit
    @todo = Todo.find_by_id(params[:id])
    puts "*****" * 5
    puts @todo.inspect
    flash.notice = "from edit "
    redirect_to :action => 'index'
  end

  def update
    
  end

end
