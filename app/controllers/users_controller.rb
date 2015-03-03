class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new    
  end

  def edit
    @user = User.find(params[:id])    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Account created with success.'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(users_params)
      redirect_to root_path, notice: 'Account updated with success.'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to 'index'
  end

  def users_params
    params.require(:user).permit(:name, :location, :gender)
  end
end
