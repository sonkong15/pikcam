module ApplicationHelper
	def toggle_currentuser(uploads)

		if current_user	
			link_to image_tag("spritethumbs.png", :class => "tolike"), likeit_upload_path(uploads), :remote => true, :id => "to_like"
		else
			link_to image_tag("spritethumbs.png", :class => "tolike"), "#", :id => "joinus" 

		end
	end
	def toggle_currentuserhate(uploads)

		if current_user	
			link_to image_tag("spritethumbs.png", :class => "tolike"),  hate_upload_path(uploads), :remote => true, :id => "ajax_trigger" 
		else
			link_to image_tag("spritethumbs.png", :class => "tolike"), "#", :id => "joinus" 

		end
	end
end
