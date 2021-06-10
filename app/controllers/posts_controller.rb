class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :repost, :share_post, :show, :share, :edit]
  
  def index
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      content: params[:content],
      image: params[:image],
      deleted: false,
    )

    if @post.save
      redirect_to root_path
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @post.update(
        user_id: current_user.id,
        content: params[:post][:content],
        image: params[:post][:image],
        deleted: false
      )
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # respond_to do |format|
    #   if @post.update(
    #     deleted: true
    #   )
    #     format.html { redirect_to root_path, notice: 'Post was successfully deleted.' }
    #     format.json { head :no_content }
    #   end
    # end
    if @post.update(
      deleted: true
    )
      redirect_to root_path
    end
  end
  
  # share post modal
  def share
  end

  def repost
    if @post
      @post = Post.new(
        user_id: current_user.id,
        content: params[:content],
        post_id: @post.id,
        deleted: false,
      )

      if @post.save
        redirect_to root_path
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:user).find(params[:id])
    end
end
