class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    @user_uploads = @user.uploads.order("created_at DESC").page(params[:page]).per(30)
    @user_flaggings = Upload.joins(:flaggings, :user).where( "flagger_id = ? AND flag = ?", "#{@user.id}", "like" ).page(params[:page]).per(30)
  end

  def new
  	@user = User.new 
  end
  
  def create
  	@user = User.new(params[:user])
    @user_session = UserSession.new(params[:user_session])
  	if @user.save
     flash[:notice] = "Registration successfull."
  		redirect_to proc { user_url(@user) }
  	else
  		render "new"
  	end
  end
    
    
  
    def edit
      @user = User.find(params[:id]) 
      authorize! :update, @user
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] ="successfull updated"
        redirect_to @user

      else
        render 'edit'

      end
    end
  
end
