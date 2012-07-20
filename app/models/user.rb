# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	attr_accessible :name, :email, :bio, :password, :password_confirmation
	
	acts_as_authentic do |c|
    c.act_like_restful_authentication = true
	end


	before_save { |user| user.email = email.downcase }

	validates :name, presence: true, length: { maximum: 25 }
	validates :name, uniqueness: {case_sensitive: false}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_presence_of(:email)
	validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	

end
