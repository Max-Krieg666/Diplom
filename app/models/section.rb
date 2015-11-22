class Section < ActiveRecord::Base
	self.primary_key = 'id'

	belongs_to :page
end
