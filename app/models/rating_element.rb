class RatingElement < ActiveRecord::Base
	include UuidHelper

	belongs_to :rating
	has_many :student_rating_elements
	validates_presence_of :title, :score

	validates_uniqueness_of :title, scope: [:rating_id]
end
