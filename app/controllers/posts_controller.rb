class PostsController < ApplicationController
  before_action :authenticate!, except: [:index]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(title: params[:title],
                                   link_url: params[:link_url])
    if @post.save
      flash[:notice] = "We saved it!"
      redirect_to posts_path
    else
      flash[:notice] = "Please fix any errors."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def index
    @posts = Post.all
    render :index
  end
end
