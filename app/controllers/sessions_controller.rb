class SessionsController < ApplicationController

  def new
  end

   def create  
    user = login(params[:email], params[:password], remember_me = false)  
    if user  
      redirect_back_or_to root_path, :notice => "Logged in!"  
    else  
      flash.now.alert = "Email or password was invalid."  
    end  
  end 

  def destroy
    logout
    redirect_to(root_path, :notice => 'Logged out!')
  end

end
