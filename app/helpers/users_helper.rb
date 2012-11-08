module UsersHelper
	def user_profile_pics
		@user = User.find(params[:id])
		if @user.avatar_file_name.blank? && @user.image_url.blank?
		   image_tag "profile-pic.jpg", :class => "profile-pic"
		  elsif  @user.avatar_file_name.blank?
		   	 image_tag @user.image_url,:size => "150x150", :class => "profile-pic face-size"
		   	else
		   	 image_tag @user.avatar.url(:small), :class => "profile-pic" 
		end
	end
end
