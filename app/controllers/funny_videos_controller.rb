class FunnyVideosController < ApplicationController
	include AutoHtml

	def new
		@video = FunnyVideo.new
		authorize! :create, @video
	end

	def create
		if  current_user
		@video = FunnyVideo.new(params[:funny_video])
		@video = current_user.funny_videos.create(params[:funny_video])
		else
		@video = FunnyVideo.create(params[:funny_video])
		end
		if @video.save
			flash[:notice] = "Video has been save"
			redirect_to proc { funny_video_url(@video) }
		else
			 render "new"
		end
	end

	def edit
		@video = FunnyVideo.find(params[:id])
		authorize! :update, @video
	end

	def update
		
	end

	def show
		@videosy = FunnyVideo.where(:dailymotionid => nil ).limit(2)
		@videosd = FunnyVideo.where(:youtubeid => nil ).limit(2)
		@video = FunnyVideo.find(params[:id])
		@uploads = Upload.order("RANDOM ()").where("private = ?", false).limit(4)
	end

	def index
		@videos = FunnyVideo.page(params[:page]).per(15)
	end

	def destroy
     	@video = FunnyVideo.find(params[:id])
     	@video.destroy
     	redirect_to current_user, notice: "Successfully destroyed video."
     	authorize! :destroy, @video
  	end
end
