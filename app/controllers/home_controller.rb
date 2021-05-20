class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user).where(deleted: false).order("created_at DESC")
  end
end
