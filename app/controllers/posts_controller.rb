class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
  end

  def create
    @posts = Post.all
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
