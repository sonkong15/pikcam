module PagesHelper
def full_title(title)
		@base_title = "Humorous Pikcam pictures"
	if @title.empty?
		@base_title
	else
		@base_title + " & " + @title
	end
end
end