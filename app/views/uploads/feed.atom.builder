atom_feed :language => 'en-US' do |feed|
	feed.title(" Pikcam's funny pics ")
	feed.updated @uploades.first.created_at

	@uploades.each do |uploades|
		feed.entry(uploades) do |entry|
			entry.title(uploades.title)
			entry.summary image_tag(uploades.picture.url(:small)), :type => 'html' 
			entry.description "find more here", link_to("humorous and cool pics", "http://www.pikcam.com"), :type => 'html' 

      end
	 end
	end
