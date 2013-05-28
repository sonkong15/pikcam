module PagesHelper
def full_title(title)
		@base_title = "Humorous pictures"
	if @title.empty?
		@base_title
	else
		@title + " & " + @base_title
	end
end
end