class ApplicationController < ActionController::Base
  protect_from_forgery
  #rescue_from CanCan::AccessDenied, :with => :not_allow


  helper_method :current_user_session, :current_user
  


  private

  def not_allow
    redirect_to r_u_lost_path, :notice => "sorry wrong URL"
  end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

 
end

