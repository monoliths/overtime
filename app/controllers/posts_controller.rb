class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
  end
  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render @post
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end
