class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
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
