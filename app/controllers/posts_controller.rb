class PostsController < ApplicationController
  before_action :authenticate!, except: [:index]

  def new
    if current_user
      render :new
    else
      flash[:notice] = "You must be logged in to create posts."
      redirect_to root_path
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "We saved it!"
      redirect_to posts_path
    else
      flash[:notice] = "Please fix any errors."
      render :new
    end
  end

  def index
    @post = Post.all
    render :index
  end
end
