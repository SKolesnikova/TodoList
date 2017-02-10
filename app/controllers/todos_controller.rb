class TodosController < ApplicationController
  before_action :set_todo!, only: [:show, :update, :destroy]

  def index
    byebug
    @todos = Todo.all
    @todo = Todo.new
  end

  def new
    @todo = current_user.todos.build
  end

  def show
  end

  def create
    @todo = Todo.new todo_params
    @todo.save
    redirect_to list_path(@todo.list)
  end

  def update
    @todo.update_attribute(:completed, todo_params[:completed] == '1')
    puts @todo.completed.to_s
    redirect_back(fallback_location: root_path)
   #redirect_to list_path(@todo.list)
  end

  def destroy
    @todo.destroy
    redirect_to list_path(@todo.list)
  end

  def completed
    @todo = Todo.new
    @todos = Todo.completed
    render 'lists/show'
  end

  def uncompleted
    @todo = Todo.new
    @todos = Todo.uncompleted
    render 'lists/show'
  end

  def delete_all
    Todo.where(completed: true).destroy_all
    redirect_to list_path(params.require(:list))
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed, :list_id)
  end

  def set_todo!
    @todo = current_user.todos.find_by(id: params[:id])
  end



end