class RatingElement < ActiveRecord::Base
	include UuidHelper

	belongs_to :rating
	belongs_to :student_rating_element
end
