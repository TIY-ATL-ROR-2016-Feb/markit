class PostsController < ApplicationController
  def new
    if current_user
      render :new
    else
      flash[:notice] = "You must be logged in to create posts."
      redirect_to root_path
    end
  end
end
