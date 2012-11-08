class UserOauthController < ApplicationController
	def create
    @current_user = User.find_or_create_from_oauth(auth_hash)
    if current_user
      UserSession.create(current_user, true)
      redirect_to proc { user_url(current_user) }, :notice => "Logged in"
      session["fb_access_token"] = auth_hash['credentials']['token']
    else
      redirect_to root_url, :flash => {:error => "Not authorized"}
    end
	end
  
  def failure
    redirect_to root_url, :flash => {:error => "Not authorized. #{params[:message]}"}
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
