class PagesController < ApplicationController
	
	def home
		@uploads = @upload
	@upload = Upload.new
	@uploads_rest = Upload.order("created_at DESC").where("private = ?", false).limit(8)
	@videos_home = FunnyVideo.order("created_at DESC").limit(6)
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
		@link = Link.new
	end

	def knowd
		
		
	end
	
	def leep2
		
	end
	def migd
		
	end

end
