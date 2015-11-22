class RatingElement < ActiveRecord::Base
	self.primary_key = 'id'

	belongs_to :rating
	belongs_to :student_rating_element
end
