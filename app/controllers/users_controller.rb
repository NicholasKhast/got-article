class UsersController < ApplicationController
  
  def index
    @users = User.all 
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to got-Article Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your Account Was Successfully Updated #{@user.username}"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User And All Of The Articles Created By User Have Been Deleted"
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])    
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
end