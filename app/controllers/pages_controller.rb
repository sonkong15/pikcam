class PagesController < ApplicationController
	
	def home
	@uploads_slideshow = Upload.order("RANDOM()").where("private = ?", false).limit(4)
	@uploads = Upload.order("created_at DESC").where("private = ?", false).limit(14)
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
	def link_up
		
	end


end
