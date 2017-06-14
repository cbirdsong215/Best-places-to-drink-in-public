class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:alert] = "You have successfully signed up!"
      redirect_to root_path(@user)
    else
      flash[:alert]= @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:alert] = "You have successfully signed up!"
      redirect_to root_path(@user)
    else
      flash[:alert]= @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :admin)
  end
end
