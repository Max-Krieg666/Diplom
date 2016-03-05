jQuery ->
	$('#document_file').attr('name','document[file]')
	$('#new_upload').fileupload
		dataType: 'script'
		add: (e, data) ->
			data.context = $(tmpl("template-upload", file))
			$('#new_upload').append(data.context)
			data.submit()
		progress: (e, data) ->
			if data.context
				progress = parseInt(data.loaded / data.total * 100, 10)
				data.context.find('.bar').css('width', progress + '%')
