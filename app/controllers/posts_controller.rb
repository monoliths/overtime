class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
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
      render :new
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

  private
  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end
end
