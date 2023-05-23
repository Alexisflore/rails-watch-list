class ListsController < ApplicationController

  def create
    @list = List.new(list_params)
    if @list.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
  end

  def index
    @lists = List.all
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
