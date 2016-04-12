class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end


  # def update
  #   # Can't use strong params here because img and image don't match.
  #   @user = User.find(params[:id])
  #   @user.update(foo: params[:foo],
  #                bar: params[:bar],
  #                img: params[:image])
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.permit(:email, :password, :confirmation, :full_name)
  end
end
