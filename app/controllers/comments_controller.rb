class CommentsController < ApplicationController
  before_action :find_post, except: [:destroy]
  before_action :find_comment, only: [:destroy, :update]

  def create
    @comment = @post.comments.new(
      user_id: current_user.id,
      post_id: params[:post_id],
      comment: params[:comment],
      deleted: false
    )

    # Insert more validations here
    if !@comment.save
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    respond_to do |format|
      if @comment.update(
        deleted: true
      )
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @comment.update(
        user_id: current_user.id,
        comment: params[:comment],
        deleted: false
      )
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def find_comment
    @comment = Comment
      .where(id: params[:id])
      .where(deleted: false)
      .where(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
