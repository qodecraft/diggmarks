class BookmarksController < ApplicationController
  

  
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmarks = @topic.bookmarks
    @bookmark = @topic.bookmarks.build(params.require(:bookmark).permit(:link, :topic_id))
    @bookmark.topic = @topic
    @new_bookmark = Bookmark.new
    if @bookmark.save
      flash[:notice] = "Bookmark was saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error, please try again later"
      redirect_to @topic
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.topic = @topic
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark was destroyed successfully"
      redirect_to [@topic]
    else
      flash[:error] = "There was an error, please try again later"
    end
  end
end
