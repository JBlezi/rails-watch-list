class ListsController < ApplicationController
  before_action :set_lists, only: [:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list.destroy
    # No need for app/views/lists/destroy.html.erb
    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:article).permit(:name, :photo)
  end

  def set_lists
    @list = List.find(params[:id])
  end
end
