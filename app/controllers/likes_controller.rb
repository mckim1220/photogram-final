class LikesController < ApplicationController
  def index
  end

  def add
    myLike = Like.new
    photoid =  params[:photo]
    userid =  params[:user]
    myLike.user_id = userid
    myLike.photo_id = photoid
    if myLike.save!
      photop = Photo.find_by(id:photoid)
      photop.update(likes_count: photop.likes_count + 1)
      flash[:alert] = "Like created."
      redirect_to photos_view_path(id:photoid)

    else
      flash[:alert] = "Something went wrong."
      redirect_to photos_view_path(id:photoid)
    end

  end

  def remove
    myLike = Like.find_by(user_id:params[:user],photo_id:params[:photo])
    if myLike.destroy
      photop = Photo.find_by(id: params[:photo])
      photop.update(likes_count: photop.likes_count - 1)
      flash[:alert] = "Like removed."
      redirect_to photos_view_path(id:params[:photo])
    else
      flash[:alert] = "Something went wrong."
      redirect_to photos_view_path(id:params[:photo])
    end
  end

  def update
  end
end
