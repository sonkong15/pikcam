class PagesController < ApplicationController
	
	def home
	 @upload = Upload.new
	 @user = User.all
	end

	def about
		
	end

	def help
		
	end

	def contact
		
	end


end
