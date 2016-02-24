class Rating < ActiveRecord::Base
	self.primary_key = 'id'

	belongs_to :discipline
	has_many :rating_elements

	validates :max_score, presence: true #, maximum: 100
end
