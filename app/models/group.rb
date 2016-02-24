class Group < ActiveRecord::Base
	include UuidHelper

	has_many :users
	has_many :disciplines

  validates_presence_of :numer
	validates_uniqueness_of :numer
end
