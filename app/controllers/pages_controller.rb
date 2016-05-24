class PagesController < ApplicationController
	before_action :check_user
  before_action :set_discipline
  before_action :teacher_permission, except: [:show, :index]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    if @discipline
      @pages = @discipline.pages
    else
      respond_to do |format|
        format.html { redirect_to root_path, error: 'Неправильный путь!' }
        format.json { render :nothing, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Страница учебных материалов создана.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Страница учебных материалов изменена.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Страница учебных материалов удалена.' }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
      @discipline = @page.discipline
    end

    def page_params
      params.require(:page).permit(:title, :content, :discipline_id)
    end

    def set_discipline
      @discipline = Discipline.find(params[:discipline_id]) if params[:discipline_id]
    end
end
