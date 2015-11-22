class StudentRatingElement < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :rating_elements
	belongs_to :user
end
