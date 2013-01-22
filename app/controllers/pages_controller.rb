class PagesController < ApplicationController
	
	def home
	@uploads_slideshow = Upload.order("RANDOM()").where("private = ?", false).limit(4)
	@uploads_rest = Upload.order("created_at DESC").where("private = ?", false).limit(12)
	@videos_home = FunnyVideo.order("created_at DESC").offset(3).limit(9)
	@videos_home2 = FunnyVideo.order("created_at DESC").limit(3)
	@uploads_likes = Upload.joins(:flaggings).order(" flaggings.created_at DESC").limit(4)
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
