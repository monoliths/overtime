class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @posts = Post.all
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
  end

  def update
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
      params.require(:post).permit(:date, :rationale)
    end
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end
end
