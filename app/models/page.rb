class Page < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :sections
	belongs_to :discipline
end
