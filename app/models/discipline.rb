class Discipline < ActiveRecord::Base
	include UuidHelper

	has_many :pages
	has_and_belongs_to_many :users
	has_one :rating
	belongs_to :group
end