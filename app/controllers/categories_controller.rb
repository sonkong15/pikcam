class CategoriesController < ApplicationController
	def index
	@upload = Upload.new
	@uploads_rest = Upload.order("created_at DESC").where("private = ?", false).page(params[:page]).per(8)
	@videos_home = FunnyVideo.order("created_at DESC").limit(6)
	@categories = Category.order(:name)
	respond_to do |format|
		format.html
		format.json { render json: @categories.tokens(params[:q]) }
		
	end
	end

	def show 
		@upload = Upload.new
		@videos_home = FunnyVideo.order("created_at DESC").limit(6)
		@category = Category.find(params[:id])
		@uploads_rest = @category.uploads.page(params[:page]).per(8).order("created_at DESC").where("private = ?", false )
	end

	def new
		@category = Category.new
		authorize! :create, @user
	end

	def create
	  @category = Category.new(params[:category])

	  if @category.save
	  	redirect_to proc { category_url(@category) }
	  	
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

