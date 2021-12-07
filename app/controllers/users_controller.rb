class UsersController < ApplicationController
  def index
    if Current.user
      @users = User.all
      @follows = Follow.where(sender_id:Current.user.id)
    else
      @users = User.all
    end
  end

  def view
    if Current.user
      @foundUser = User.find_by(username: params[:name])
      @userFull = User.where(username: params[:name]).includes(:photo).as_json(include: :photo)[0]
      @following = Follow.where(sender_id: @foundUser.id,status:"ok").count
      @followers = Follow.where(recipient_id: @foundUser.id,status:"ok")
      @followReqs = Follow.where(recipient_id: @foundUser.id,status:"pending")
      @photos = @userFull['photo']
      if @foundUser.id != Current.user.id && @foundUser.private
        checkFollow = Follow.where(recipient_id: @foundUser.id,sender_id: Current.user.id ,status:"ok").count
        if checkFollow == 0
          flash[:alert] = "This is private account."
          redirect_to root_path
        end
      end
    else
      flash[:alert] = "You have to sign in first."
      render :login
    end
  end

  def new
    @user = User.new
  end
  def login
  end
  def logged
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:alert] = "Logged in successfully"
        redirect_to root_path
    else
        flash[:alert] = "No user with that email address."
        render :login
    end
  end
  def logout
    session[:user_id] = nil
    flash[:alert] = "Signed out successfully."
    redirect_to root_path
  end
  def create
    @user = User.new(user_params)
    @user.comments_count = 0
    @user.likes_count = 0
    if @user.save
        session[:user_id] = @user.id
        flash[:alert] = "Account Created"
        redirect_to root_path
    else
        flash[:alert] = "User account failed to create."
        render :new
    end
  end

  def edit
    if Current.user
      @user = Current.user
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end

  def update
    if Current.user
        if Current.user.update(user_edit_params)
          flash[:alert] = "Your account has been updated"
          render :edit
        else
          flash[:alert] = "Something wen wrong!"
          render :edit
        end
    else
        flash[:alert] = "You have to sign in first."
        render :login
    end
  end

  def delete
  end

  private

  def user_params
      params.require(:user).permit(:username,:email,:password,:password_confirmation,:private)
  end
  def user_edit_params
    params.require(:user).permit(:username,:email,:password,:password_confirmation,:private,:username,:comments_count,:likes_count)
end
end
