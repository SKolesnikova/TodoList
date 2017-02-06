class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    #@todo = Todo.new
    @todo = current_user.todos.build
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = current_user.todos.build(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def update
    @todo = Todo.find params[:id]
    @todo.update_attributes(completed: todo_params[:completed])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy
    redirect_to todos_path
  end

  def completed
    @todos = Todo.completed
    @todo = Todo.new
    render 'index'
  end

  def uncompleted
    @todos = Todo.uncompleted
    @todo = Todo.new
    render 'index'
  end

  def delete_all
    Todo.where(completed: true).destroy_all
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit([:title, :completed])
  end


end
