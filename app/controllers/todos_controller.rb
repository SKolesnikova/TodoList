class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new todo_params
    @todo.save
    redirect_to todos_path
  end

  def update
    @todo = Todo.find params[:id]
    @todo.update_attributes(completed: todo_params[:completed])
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy
    redirect_to todos_path
  end

  def completed
    @todos = Todo.where(completed:true)
    @todo = Todo.new
    render 'index'
  end

  def uncompleted
    @todos = Todo.where(completed:false)
    @todo = Todo.new
    render 'index'
  end


  private
  def todo_params
    params.require(:todo).permit([:title, :completed])
  end


end
