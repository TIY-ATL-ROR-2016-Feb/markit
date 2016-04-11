class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:email],
                     full_name: params[:full_name],
                     password: params[:password],
                     password_confirmation: params[:confirmation])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end
