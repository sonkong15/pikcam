class PagesController < ApplicationController
	
	def home
	@uploads = Upload.order("created_at DESC").where("private = ?", false).limit(12)
	@upload = Upload.new
	end

	def about
		
	end

	def help
		
	end

	def contact
		
	end
	def terms
		
	end
	def privacy
		
	end
	def lost_page
		
	end


end
