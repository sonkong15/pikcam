class CategoriesController < ApplicationController
	def index
	@uploads = Upload.order("created_at DESC").where("private = ?", false).page(params[:page]).per(12)
	@upload_top = Upload.order("RANDOM()").where("private = ?", false).limit(8)
	@categories = Category.order(:name)
	respond_to do |format|
		format.html
		format.json { render json: @categories.tokens(params[:q]) }
		
	end
	end

	def show 
		@category = Category.find(params[:id])
		@upload = @category.uploads.page(params[:page]).per(50).order("created_at DESC").where("private = ?", false )
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

