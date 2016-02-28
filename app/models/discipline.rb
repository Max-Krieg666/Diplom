class Discipline < ActiveRecord::Base
	include UuidHelper

	has_many :pages
	has_and_belongs_to_many :users, uniq: true
	has_one :rating
	belongs_to :group

	validates_presence_of :group, :title
	validates_uniqueness_of :title, scope: [:group]
end