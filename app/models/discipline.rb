class Discipline < ActiveRecord::Base
	self.primary_key = 'id'

	has_many :pages
	has_and_belongs_to_many :users
	has_one :rating
	has_one :group

	def teacher
		user.fio
	end
end
# TODO разобраться, как дествовать далее с дисциплиной
# либо добавить поле teacher_id (user_id) и работать с ним
# либо has_and_belongs_to_many - эту тупую связь доработать