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
	
	attr_accessible :name, :email, :bio, :password, :password_confirmation, :facebook_link,
	:website_link,:avatar
	has_many :uploads
	has_many :comments
	def role?(role)
		user.id == current_user.id
	end


	acts_as_authentic do |c|
    c.act_like_restful_authentication = true
	end
    has_attached_file :avatar, :styles =>{ :small => "150x150>"}

	before_save { |user| user.email = email.downcase }

	validates :name, presence: true, length: { maximum: 25 }
	validates :name, uniqueness: {case_sensitive: false}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_presence_of(:email)
	validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: { minimum: 6 }, :on => :create
	validates :password_confirmation, presence: true, :on => :create
	validates :bio, length: {maximum: 1000}

	

end
