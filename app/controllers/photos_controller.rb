class PhotosController < ApplicationController
  def index
    @photos = Photo.all.includes(:user).as_json(include: :user)
    @photo = Photo.new
  end

  def view
    if Current.user
      @photo = Photo.find_by(id:params[:id])
      @user = User.find_by(id:@photo.user_id)
      @comments = Comment.where(photo_id:params[:id])
      @likes = Like.where(photo_id:params[:id])
      @liked = Like.find_by(user_id:Current.user.id,photo_id:params[:id])
      @comment= Comment.new
    else
        flash[:alert] = "You have to sign in first."
        redirect_to login_users_path
    end
  end

  def add
    photo = Photo.new(photo_params)
    photo.user = Current.user
    photo.comments_count = 0
    photo.likes_count = 0
    photo.image = params[:photo][:file]
    if photo.save!
      flash[:alert] = "Photo has been created"
    else
      flash[:alert] = "Failed to post new photo"
    end
    redirect_to photos_path
  end

  def edit
  end

  def remove
  end

  def update
  end

  def delete
  end
  private
  def photo_params
    params.require(:photo).permit(:caption,:image)
  end
end
