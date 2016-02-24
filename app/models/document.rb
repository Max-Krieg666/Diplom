class Document < ActiveRecord::Base
	include UuidHelper

	belongs_to :user
end
