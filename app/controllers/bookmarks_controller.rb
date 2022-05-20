class BookmarksController < ApplicationController
  before_action :set_bookmarks, only: [:show, :edit, :update, :destroy]
  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @lists = List.all
  end

  def create
    @bookmark = Bookmark.new(comment: params["bookmark"]["comment"], movie_id: params["bookmark"]["movie_id"], list_id: params["bookmark"]["list_id"])
    @bookmark.save
    redirect_to bookmarks_path
  end

  def edit
  end

  def update
    @bookmark.update(bookmark_params)
    redirect_to bookmark_path(@bookmark)
  end

  def destroy
    @bookmark.destroy
    # No need for app/views/bookmarks/destroy.html.erb
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_bookmarks
    @bookmark = Bookmark.find(params[:id])
  end
end
