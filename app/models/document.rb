class Document < ActiveRecord::Base
	include Rails.application.routes.url_helpers
	include UuidHelper

	belongs_to :user

	mount_uploader :file, Uploader

	def file_size
		s = file.size
		if s < 512
		  "#{s} #{Russian.p(s, 'байт', 'байта', 'байт')}"
		else
			"#{(s/1024.0).round(2)} Кб"
		end
	end

	def file_url
		file.url
	end
end
