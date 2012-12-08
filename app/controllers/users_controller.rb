class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_uploads = @user.uploads.order("created_at DESC").page(params[:page]).per(15)
    @user_flaggings = Upload.joins(:flaggings, :user).where( "flagger_id = ? AND flag = ?", "#{@user.id}", "like" ).page(params[:page]).per(30)
    my_facebook
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

    def my_facebook
       @friends = Array.new
       if session["fb_access_token"].present?
         @graph = Koala::Facebook::GraphAPI.new(session["fb_access_token"])
         @profile_image = @graph.get_picture("me")
         @fbprofile = @graph.get_object("1839323679")
         @friends = @graph.get_connections("me", "friends")
         @feed = @graph.get_connections("me", "likes")
         @search = @graph.search("donnie")
         #@wall = @graph.put_wall_post("Hey, im playing around with my new site pikcam!!!!", {"picture" => @pics}, "")
        #@pic = @graph.put_picture(@pics)
        @pics = "http://s3.amazonaws.com/pik.pikcam.com/273/original.jpg?1352049026"
       end
    end
    #638655696
end
