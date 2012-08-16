class CategoriesController < ApplicationController
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
