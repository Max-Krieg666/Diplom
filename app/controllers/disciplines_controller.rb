class DisciplinesController < ApplicationController
	before_action :check_user
	before_action :admin_permission, only: [:new, :create, :destroy]
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
	before_action :set_teachers, only: [:show, :edit, :update, :new, :create]

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
		@discipline.rating = Rating.create(max_score: 100)
		respond_to do |format|
      if params[:user_ids].presence && @discipline.save
				params[:user_ids].each do |u|
					@discipline.users << User.find(u)
				end
        format.html { redirect_to @discipline, notice: 'Дисциплина успешно создана.' }
        format.json { render :show, status: :created, location: @discipline }
			else
				@discipline.errors.add(:users, 'Необходимо выбрать преподавателя') unless params[:user_ids].presence
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
	def set_discipline
		@discipline = Discipline.find(params[:id])
	end

	def set_teachers
		@teachers = User.where(is_active: true, role: 1)
	end

	def discipline_params
		params.require(:discipline).permit(:title, :group_id)
	end
end
