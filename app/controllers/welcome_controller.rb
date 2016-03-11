class WelcomeController < ApplicationController
  
  def new
    redirect_to articles_path if logged_in?
  end
  
end
  
