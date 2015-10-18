class Comment < ActiveRecord::Base
	belongs_to :concert

 	validates :message, presence: true
end
