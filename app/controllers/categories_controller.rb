class CategoriesController < ApplicationController
	def index
	@uploads_slideshow = Upload.order("RANDOM()").where("private = ?", false).limit(4)
	@uploads = Upload.order("created_at DESC").where("private = ?", false).limit(8)
	@upload_top = Upload.joins(:flaggings).where("flag = ? ", "like").order("flaggings.flag DESC").uniq.limit(8)
	@categories = Category.order(:name)
	respond_to do |format|
		format.html
		format.json { render json: @categories.tokens(params[:q]) }
		
	end
	end

	def show 
		@category = Category.find(params[:id])
		@upload = @category.uploads.page(params[:page]).per(40).order("created_at DESC").where("private = ?", false )
	end

	def new
		@category = Category.new
		authorize! :create, @user
	end

	def create
	  @category = Category.new(params[:category])

	  if @category.save
	  	render "show"
	  	
	  end
		
	end
	def edit
      @category = Category.find(params[:id]) 
      authorize! :update, @user
  	end
    
    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        flash[:notice] ="successfull updated"
        redirect_to @category

      else
        render 'edit'

      end
    end
	
end

