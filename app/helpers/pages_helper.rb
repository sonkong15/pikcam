module PagesHelper
def full_title(title)
		@base_title = " Pikcam funny pictures"
	if @title.empty?
		@base_title
	else
		@base_title + " | " + @title
	end
end
end