class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @new_posts = Post.all.find_newest_article
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.attributes = {
      user_id: current_user.id
    }
    if @post.save
      redirect_to user_post_path(current_user, @post), notice: "blog registered"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post), notice: "blog updated"
    else
      render :edit
    end
  end

  def destroy
    
    @post.destroy
      redirect_to posts_path, notice: "blog deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
