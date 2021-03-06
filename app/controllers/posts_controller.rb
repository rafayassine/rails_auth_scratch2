class PostsController < ApplicationController
  before_filter :authorize
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.all.order("created_at DESC")
  end
  def new
    @post = Post.new
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render new_post_path
    end
  end
  def edit

  end
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_post_path
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def find_post
      @post=Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
