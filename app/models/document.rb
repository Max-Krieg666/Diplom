class Document < ActiveRecord::Base
	include Rails.application.routes.url_helpers
	include UuidHelper

	belongs_to :user

	mount_uploader :file, Uploader

	def file_title
		read_attribute(:file)
	end

	def file_size
		file.size
	end

	def file_url
		file.url
	end
end
