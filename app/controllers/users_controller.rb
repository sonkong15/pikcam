class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new 
  end
  
  def create
  	@user = User.new(params[:user])
  	if @user.save
     flash[:notice] = "Registration successfull."
  		render "show"
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
