class SessionsController < ApplicationController

  def new
  end
  
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Your Have Successfully LoggedIn "
      redirect_to user_path(user)
    else
      flash.now[:notice] = "Oops! Your Login Information Was Not Correct!"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You Have LoggedOut"
    redirect_to root_path
  end

end