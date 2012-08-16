class UploadsController < ApplicationController
	def new
		@upload = Upload.new 
	end

	def create
		@upload = Upload.new(params[:upload])
		@upload = current_user.uploads.create(params[:upload])
		if @upload.save
			render :json => { :pic_path => @upload.picture.url.to_s , :name => @upload.picture.instance.attributes["picture_file_name"] }, :content_type => 'text/html'
			flash[:notice] = "Picture has been save"
			
		else
			 render :json => { :result => 'error'}, :content_type => 'text/html'
		end
	end

	
	
	

	def show
		@upload = Upload.find(params[:id]) 
	end
end
