class StudentRatingElement < ActiveRecord::Base
	include UuidHelper

	has_many :rating_elements
	belongs_to :user
end
