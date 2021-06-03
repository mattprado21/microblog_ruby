class UsersController < ApplicationController
  before_action :configure_sign_up_params, only: [:sign_up]
  before_action :set_user_info, only: [:update_profile]

  def index
  end

  def sign_up
  end

  def sign_in
  end
  def edit

  end
  def update_profile
    if @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthdate: params[:birthdate],
      bio: params[:bio],
    )
      redirect_back fallback_location: root_path
    end
  end

  def show
    @user = User.find(params[:id])

    @posts = Post.includes(:user)
      .where(deleted: false, user_id: params[:id])
      .order("created_at DESC")
      .paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: 5)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 5)
    render 'show_follow'
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private
  def set_user_info
    @user = User.find(current_user.id)
  end
end
