class StudentRatingElement < ActiveRecord::Base
	include UuidHelper

	belongs_to :rating_element
	belongs_to :user
end
