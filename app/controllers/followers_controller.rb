class FollowersController < ApplicationController
  def add
    if Current.user
      target = User.find_by(username: params[:name])
      
      user = Current.user

      if target.private
        follow = Follow.new({sender_id:user.id,recipient_id:target.id,status:"pending"})
        if follow.save
          flash[:alert] = "Follow request sent!"
          redirect_to root_path
        else
          flash[:alert] = "Something went wrong!"
          redirect_to root_path
        end
      else
        follow = Follow.new({sender_id:user.id,recipient_id:target.id,status:"ok"})

        if follow.save
          flash[:alert] = "You are following him now!"
          redirect_to root_path
        else
          flash[:alert] = "Something went wrong!"
          redirect_to root_path
        end
      end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end
  def accept
    if Current.user
      target = User.find_by(id: params[:id])
      user = Current.user
      follow = Follow.find_by(sender_id:target.id,recipient_id:user.id,status:"pending")
      if follow.update(status:"ok")
        flash[:alert] = "You accepted that"
        redirect_to root_path
      else
        flash[:alert] = "Something went wrong!"
        redirect_to root_path
      end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end
  def deny
    if Current.user
      target = User.find_by(id: params[:id])
      user = Current.user
      follow = Follow.find_by(sender_id:target.id,recipient_id:user.id,status:"pending")
      if follow.destroy
        flash[:alert] = "You rejected that"
        redirect_to root_path
      else
        flash[:alert] = "Something went wrong!"
        redirect_to root_path
      end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end
  def remove
    if Current.user
      target = User.find_by(id: params[:id])
      user = Current.user
      follow = Follow.find_by(sender_id:target.id,recipient_id:user.id)
      if follow.destroy
        flash[:alert] = "You unfollowed that"
        redirect_to root_path
      else
        flash[:alert] = "Something went wrong!"
        redirect_to root_path
      end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end
  def removefall
    if Current.user
      target = User.find_by(id: params[:id])
      user = Current.user
      follow = Follow.find_by(sender_id:user.id,recipient_id:target.id)
      if follow.destroy
        flash[:alert] = "You unfollowed that"
        redirect_to root_path
      else
        flash[:alert] = "Something went wrong!"
        redirect_to root_path
      end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end
end
