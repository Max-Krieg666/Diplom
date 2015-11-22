class Discipline < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :pages
	has_and_belongs_to_many :users
	has_one :rating
	has_one :group
end
