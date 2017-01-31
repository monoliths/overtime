class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def show
  end

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: "Your post was created successfuly."
    else
      render 'new'
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
