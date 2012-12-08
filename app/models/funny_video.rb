class FunnyVideo < ActiveRecord::Base
  attr_accessible :dailymotion, :title, :youtube, :facebook
  belongs_to :user
  before_save :dailymotion_thumb, :youtube_thumb, :facebook_thumb
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

  	def youtube_thumb
    	regex = /https?:\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
    	self.youtube.sub(regex) do
    	video_id = $3
    	self.youtubeid = %{http://img.youtube.com/vi/#{video_id}/1.jpg}
    	end
    	#@you_thumb = videos.video.gsub(/^http:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/) do	
	end

	def dailymotion_thumb
  		self.dailymotion.gsub(/http:\/\/www\.dailymotion\.com.*\/video\/(.+)_*/) do
    	video_id = $1
    	self.youtubeid = %{http://www.dailymotion.com/thumbnail/video/#{video_id}}

    	end
  	end
    def facebook_thumb
      self.facebook.gsub(/^http(?:s?):\/\/www\.facebook\.com\/photo.php\?v=(\d+)/) do
      video_id = $1
      self.youtubeid = %{https://graph.facebook.com/#{video_id}/picture}

      end
    end



  auto_html_for :youtube do
    html_escape
    image
    youtube(:width => 640, :height => 360)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
  auto_html_for :dailymotion do
    html_escape
    image
    dailymotion(:width => 640, :height => 360)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  auto_html_for :facebook do
    html_escape
    image
    facebook(:width => 540, :height => 260)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

	AutoHtml.add_filter(:youtube).with(:width => 420, :height => 315, :frameborder => 0, :wmode => nil) do |text, options|
	  regex = /https?:\/\/(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\S)*/
	  text.gsub(regex) do
	    youtube_id = $3
	    width = options[:width]
	    height = options[:height]
	    frameborder = options[:frameborder]
			wmode = options[:wmode]
			src = "//www.youtube.com/embed/#{youtube_id}?rel=0&showinfo=0&theme=light"
			src += "?wmode=#{wmode}" if wmode
	    %{<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe>}
	  end

	end
	AutoHtml.add_filter(:dailymotion).with(:width => 480, :height => 360) do |text, options|
	  text.gsub(/http:\/\/www\.dailymotion\.com.*\/video\/(.+)_*/) do
	    video_id = $1
      %{<iframe frameborder="0" width="#{options[:width]}" height="#{options[:height]}" src="http://www.dailymotion.com/embed/video/#{video_id}?foreground=%23FFFFFF&highlight=%23003CFF&logo=0"></iframe>}
	    
	  end
	end

  AutoHtml.add_filter(:facebook).with(:width => 580, :height => 460) do | text, options|
    text.gsub(/^http(?:s?):\/\/www\.facebook\.com\/photo.php\?v=(\d+)/) do
      facebook_id = $1
      %{<object width="640" height="360"><param name="allowfullscreen" value="true"></param><param name="movie" value="https://www.facebook.com/v/#{facebook_id}"></param><embed src="https://www.facebook.com/v/#{facebook_id}" type="application/x-shockwave-flash" allowfullscreen="true" width="640" height="360"></embed></object>}
    end
  end

	def previous_video
  		self.class.first(:conditions => ["created_at  < ? ", created_at ], :order => "created_at desc")
	end

	def next_video
  		self.class.first(:conditions => ["created_at  > ? ", created_at ], :order => "created_at asc")
	end
end
