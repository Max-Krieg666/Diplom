class DocumentsController < ApplicationController
	before_action :check_user
  before_action :set_document, only: [:destroy]

  def index
    @documents = Document.all
  end

  def new
  end

  def create
		p_attr = document_params
		files = p_attr[:file]
		count = files.size
		for i in 0...count
			@document = Document.new(file: files[i])
			@document.user_id = @current_user.id
			unless @document.save
				flash[:error] = 'Ошибка при загрузке файла ' + files[i].original_filename
				render :new
			end
		end
		flash[:success] = "#{count} #{Russian.p(count, "файл успешно загружен", "файла успешно загружено", "файлов успешно загружено")}."
		redirect_to documents_url
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Файл удалён.' }
      format.json { head :no_content }
    end
  end

  private

	def set_document
		@document = Document.find(params[:id])
	end

	def document_params
		params.require(:document).permit({file: []})
	end
end
