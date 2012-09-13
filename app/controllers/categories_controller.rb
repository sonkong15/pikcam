class CategoriesController < ApplicationController
	def index
	@uploads_slideshow = Upload.order("RANDOM()").where("private = ?", false).limit(4)
	@uploads = Upload.order("created_at DESC").where("private = ?", false).limit(8)
	@categories = Category.order(:name)
	respond_to do |format|
		format.html
		format.json { render json: @categories.tokens(params[:q]) }
		
	end
	end

	def show 
		@category = Category.find(params[:id])
		@upload = @category.uploads.page(params[:page]).per(40).order("created_at DESC")
	end

	def new
		@category = Category.new
	end

	def create
	  @category = Category.new(params[:category])
	  if @category.save
	  	render "show"
	  	
	  end
		
	end
	
end

