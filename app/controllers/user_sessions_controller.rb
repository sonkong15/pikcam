class UserSessionsController < ApplicationController
  
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to current_user
    else
      render :action => :new
    end
  end
  
  def destroy
  	@user_session = UserSession.find
    current_user_session.destroy
    flash[:notice] = "Logout successful, See you later :)! "
    redirect_to root_url
  end
end