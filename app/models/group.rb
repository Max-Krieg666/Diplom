class Group < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :users
	has_many :disciplines

	validates_uniqueness_of :numer
end
