class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    if User.admin?(current_user)
      @posts = Post.all
    else
      @posts = Post.posts_by current_user
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Your post was created successfuly.'
    else
      render :new, notice: 'There was an error saving your post.'
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was updated successfuly.'
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: 'Your post has been deleted'
  end

  private
  def post_params
    # Only Permin status on admin users
    if User.admin?(current_user)
      params.require(:post).permit(:date, :rationale, :status)
    else
      params.require(:post).permit(:date, :rationale, :overtime_request)
    end
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end

  def user_not_authorized
    flash[:alert] = "Not Authorized: This post does not belong to your account!"
    redirect_to root_path
  end

end
