class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.new(
      user_id: current_user.id,
      post_id: params[:post_id],
      comment: params[:comment][:comment],
      deleted: false
    )

    # Insert more validations here
    if !@comment.save
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
    redirect_back fallback_location: root_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
