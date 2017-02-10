class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :completed, :uncompleted]

  def index
    @lists = current_user.lists
  end

  def show
    # debugger
    @todos = @list.todos
  end

  def completed
    @todos = @list.todos.completed
    render :show
  end

  def uncompleted
    @todos = @list.todos.uncompleted
    render :show
  end

  def new
    @list = current_user.lists.build
  end

  def edit

  end

  def create
    @list = List.new(title: list_params[:title], user: current_user)
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(title: list_params[:title], user: current_user)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find_by(:id => params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title)
  end
end