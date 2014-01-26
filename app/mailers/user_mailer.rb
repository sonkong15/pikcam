class UserMailer < ActionMailer::Base
  default from: "Pikcam-Game@pikcam.com"

	def signup_confirmation(user)
     @user = user
     mail to: user.email, subject: "Sign Up Confirmation"
	end
	def get_friends(user)
     @user = user
     mail to: user.email, subject: "Help us get friends"
	end
end
