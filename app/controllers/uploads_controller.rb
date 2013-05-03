class UploadsController < ApplicationController
	def index
		@uploads = Upload.order("created_at DESC").where("private = ?", false).page(params[:page]).per(8)
     respond_to do |format|
    format.html     # index.html.erb
    format.atom     # index.atom.builder
    format.xml  { render :xml => @articles }
  end
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
		@uploads = Upload.order("RANDOM ()").joins(:categories).where("category_id = ? AND private = ? AND picture_content_type = ? ", @upload.categories.first.id, false, "image/jpeg" ).limit(4)
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
  	def like
  		@upload = Upload.find(params[:id])
  		if current_user.flagged?(@upload, :like)
  			current_user.unflag(@upload, :like)
  			redirect_to upload_url(@upload), :notice => " you unlike the picture "
  			else
  			current_user.flag(@upload, :like)
  			redirect_to upload_url(@upload), :notice => " you like the picture "

  		end
  		
  	end
    

  	def top
      @upload = Upload.new
  		@upload_top = Upload.plusminus_tally.page(params[:page]).per(8)
  		@videos_home = FunnyVideo.order("created_at DESC").limit(6)
  	end
    def feed
      @uploades = Upload.order(" created_at DESC")
      
      respond_to do |format|
      format.atom
      end
    end
    def likeit 
      @upload = Upload.find(params[:id])
        respond_to do |format|
        if current_user.voted_for?(@upload)
         format.html { redirect_to :back, :notice => " you are only allow to dis like once "}
         format.js { redirect_to :back, :notice => " you are only allow to dis like once "}
         else
          current_user.vote_exclusively_for(@upload)
          format.html { redirect_to :back, :notice => " you like the picture!! "}
         format.js { redirect_to :back, :notice => " you like the picture!! "}
        end
        end
    end
  def hate
      @upload = Upload.find(params[:id])
       respond_to do |format|
        if current_user.voted_against?(@upload)
         format.html { redirect_to :back, :notice => " you are only allow to dis like once "}
         format.js { redirect_to :back, :notice => " you are only allow to dis like once "}
        else
         current_user.vote_exclusively_against(@upload)
         format.html { redirect_to :back, :notice => " you dislike the picture!! "}
         format.js { redirect_to :back, :notice => " you dislike the picture!! "}
        end
        end

  end
  
    private

    
end
