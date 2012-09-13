class UploadsController < ApplicationController
	def index
		@uploads = Upload.order("created_at DESC").where("private = ?", false).page(params[:page]).per(50)
	end
	def new
		@upload = Upload.new 
	end

	def create
		if  current_user
		@upload = Upload.new(params[:upload])
		@upload = current_user.uploads.create(params[:upload])
		else
		@upload = Upload.create(params[:upload])
		end
		if @upload.save
			
			flash[:notice] = "Picture has been save"
			redirect_to proc { upload_url(@upload) }
		else
			 render "new"
		end
	end

	def show
		@upload = Upload.find(params[:id])
		@uploads = Upload.order("RANDOM ()").where("private = ?", false).limit(6)
		@category = Category.joins(:uploads) 	
	end

	def edit
      @upload = Upload.find(params[:id]) 
      authorize! :update, @upload
  	end
  	def update 
  		@upload = Upload.find(params[:id])
  		if @upload.update_attributes(params[:upload])
  			flash[:notice] = "Picture has been updated"
			redirect_to proc { upload_url(@upload) }
		else
			render "edit"
  		end
  	end

	
	def destroy
     @upload = Upload.find(params[:id])
     	@upload.destroy
     	redirect_to current_user, notice: "Successfully destroyed Picture."
     	authorize! :destroy, @upload
  	end

end
