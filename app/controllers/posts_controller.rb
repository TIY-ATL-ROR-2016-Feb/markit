class PostsController < ApplicationController
  before_action :authenticate!, except: [:index]

  def new
    @post = Post.new
    binding.pry
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

  # def finalize
  #   @client = Client.find(params[:id])
  #   saved = true
  #   ActiveRecord::Base.transaction do
  #     @client.invoices.each do |invoice|
  #       invoice.hours_billed = params[:invoices][invoice.id][:hours]
  #       saved = false unless invoice.save
  #     end
  #   end
  #   if @saved
  #     redirect_to new_page
  #   else
  #     render :form
  #   end
  # end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def index
    @posts = Post.all
    render :index
  end
end
