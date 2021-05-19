class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.create(
      user_id: current_user.id,
      content: params[:content],
      deleted: false,
    )

    if @post.save
      redirect_to root_path
      # redirect_to :back
    end
  end
end
