class DocumentsController < ApplicationController
	before_action :check_user
  before_action :set_document, only: [:show, :edit, :destroy]

  def index
    @documents = Document.all
		# render :json => @documents.collect { |p| p.to_jq_upload }.to_json
  end

  def show
  end

  def new
  end

  def create
		p_attr = params[:document]
		p_attr[:file] = params[:document][:file].first if params[:document][:file].class == Array
		@document = Document.new(p_attr)
		@document.user_id = @current_user.id
		if @document.save
			flash[:success] = 'Файл успешно загружен.'
			respond_to do |format|
				format.html {
					render :json => [@document.to_jq_upload].to_json,
								 :content_type => 'text/html',
								 :layout => false
				}
				format.json {
					render :json => [@document.to_jq_upload].to_json
				}
			end
		else
			render :json => [{:error => 'Ошибка при загрузке файла'}], :status => 304
		end
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
end
