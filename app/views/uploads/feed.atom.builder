atom_feed :language => 'en-US' do |feed|
	feed.title(" Pikcam's funny pics ")
	feed.updated @uploades.first.created_at

	@uploades.each do |uploades|
		feed.entry(uploades) do |entry|
			entry.title(uploades.title)
			entry.content + '<img src="'uploades.picture.url(:small)'">', :type => 'html'

			 entry.author do |author|
        author.name uploades.user ||= ANONYMOUS
      end
	 end
	end
end
