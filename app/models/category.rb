class Category < ActiveRecord::Base
	 has_many :categorizations
	 has_many :uploads, :through => :categorizations
end
