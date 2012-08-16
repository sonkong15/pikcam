

class Upload < ActiveRecord::Base

	attr_accessible :picture, :title, :category_ids, :category_id
	belongs_to :user
	has_many :categorizations
	has_many :categories, :through => :categorizations
	accepts_nested_attributes_for :categorizations, :allow_destroy => true


	has_attached_file :picture, :styles =>{ :small => "200x200>", :large => "600x500>"}

	
end
