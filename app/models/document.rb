class Document < ActiveRecord::Base
	include Rails.application.routes.url_helpers
	include UuidHelper

	belongs_to :user

	mount_uploader :file, Uploader

	def to_jq_upload
		{
			"name" => read_attribute(:file),
			"size" => file.size,
			"url" => file.url,
			"delete_url" => "document#{id}",
			"delete_type" => "DELETE"
		}
	end
end
