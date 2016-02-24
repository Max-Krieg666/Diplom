class Discipline < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :pages
	has_and_belongs_to_many :users
	has_one :rating
	belongs_to :group

	def teachers
		users.each{ |x| x.fio }
	end
end