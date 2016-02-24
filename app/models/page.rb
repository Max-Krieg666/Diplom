class Page < ActiveRecord::Base
	include UuidHelper

	has_many :sections
	belongs_to :discipline
end
