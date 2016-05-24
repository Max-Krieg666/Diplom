class SectionsController < ApplicationController
	before_action :check_user
	before_action :set_page
  before_action :teacher_permission
  before_action :set_section, only: [:edit, :update, :destroy]

  def new
    @section = Section.new
  end

  def edit
  end

  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @page, notice: 'Создан новый раздел.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @page, notice: 'Раздел успешно изменён.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to @page, notice: 'Раздел успешно удалён.' }
      format.json { head :no_content }
    end
  end

  private
    def set_section
      @section = Section.find(params[:id])
      @page = @section.page
    end

    def section_params
      params.require(:section).permit(:title, :content, :page_id)
    end

    def set_page
      @page = Page.find(section_params[:page_id] || params[:page_id]) if section_params[:page_id] || params[:page_id]
    end
end
