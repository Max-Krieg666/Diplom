class DisciplinesController < ApplicationController
	before_action :check_user
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)
    @discipline.group = Group.find(discipline_params[:group_id])
    @rating = Rating.create(max_score: 100, discipline_id:  @discipline.id)
    @discipline.rating_id = @rating.discipline_id
    # TODO разобраться с добавлением пользователей (преподавателей) к дисциплине
    respond_to do |format|
      if @discipline.save
        # @discipline.users = User.find(discipline_params[:teachers_id])
        @discipline.users << User.find('13311930-bb97-0133-71cd-68f728c69693')
        @discipline.users << User.find('13752860-bb97-0133-71cd-68f728c69693')
        format.html { redirect_to @discipline, notice: 'Дисциплина успешно создана.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Дисциплина успешно изменена.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Дисциплина успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:title, :group_id, :teachers_id)
    end
end
