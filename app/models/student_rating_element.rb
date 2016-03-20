class StudentRatingElement < ActiveRecord::Base
	include UuidHelper

	belongs_to :rating_element
	belongs_to :user

	validates_presence_of :comment, :value
	validates_uniqueness_of :user_id, scope: [:value, :comment, :rating_element_id]
end
