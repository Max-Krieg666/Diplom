class Section < ActiveRecord::Base
	include UuidHelper

	belongs_to :page
end
