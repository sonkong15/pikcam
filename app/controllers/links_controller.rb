class LinksController < ApplicationController
	def index
		@links = Link.all
	end

	def new
		@link = Link.new
	end

	def edit
		@link = Link.find(params[:id])
	end

	def destroy
     @Link = Link.find(params[:id])
     	@Link.destroy
     	redirect_to current_user, notice: "Successfully destroyed Picture."
     	authorize! :destroy, @Link
  	end
  	def create
  		@link = Link.new(params[:link])
  	if @link.save
     flash[:notice] = "Registration of link successfull."
  		redirect_to proc { user_url(@link) }
  	else
  		render "new"
  	end
  	end
  	
  	def update 
  		@link = Link.find(params[:id])
  		if @link.update_attributes(params[:link])
  			flash[:notice] = "link has been updated"
			redirect_to  link_url
		else
			render "edit"
  		end
  	end
end
