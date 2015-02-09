class TopicsController < ApplicationController
 
  def index
    @topics = Topic.all
  end
  
  def new
    @topic = Topic.new
  end
  
  def show
    @topic = Topic.find(params[:id])  
    @bookmarks = @topic.bookmarks
  end
  
  def create
    @topic = Topic.new(params.require(:topic).permit(:name))
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

end
