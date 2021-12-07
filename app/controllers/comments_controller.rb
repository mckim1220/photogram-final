class CommentsController < ApplicationController
  def index
  end

  def add
    comments = Comment.new(comment_params)
    comments.user = Current.user
    comments.photo = Photo.find_by(id:params[:photo])
    comments.body = params[:comment][:body]
    puts params[:body]

    if comments.save!
      flash[:alert] = "Comment has been created"
    else
      flash[:alert] = "Failed to post new comment"
    end
    redirect_to photos_view_path(id:params[:photo])
  end

  def remove
  end

  def update
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
