class RatingElement < ActiveRecord::Base
	include UuidHelper

	belongs_to :rating
	belongs_to :student_rating_element
	validates_presence_of :title, :score

	validates_uniqueness_of :title, scope: [:rating_id]
end
