class Comment < ActiveRecord::Base
	attr_accessible :body
	has_many :Comment, :as => :commentable
	belongs_to :commentable, :polymorphic => true


	validates :body, legnth: { maximum: 1000 }
end
