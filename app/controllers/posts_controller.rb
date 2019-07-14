class PostsController < ApplicationController
  def index
    @posts = Post.all
    @new_posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "blog registered"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "blog updated"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path, notice: "blog deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
