class Rating < ActiveRecord::Base
	include UuidHelper

	belongs_to :discipline
	has_many :rating_elements

	validates :max_score, presence: true

	def score_now
		sum = 0
		rating_elements.map{ |elem| sum += elem.score }
		sum
	end
end
