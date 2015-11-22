class StudentRatingElementsController < ApplicationController
	before_action :check_user
  before_action :set_student_rating_element, only: [:show, :edit, :update, :destroy]

  # GET /student_rating_elements
  # GET /student_rating_elements.json
  def index
    @student_rating_elements = StudentRatingElement.all
  end

  # GET /student_rating_elements/1
  # GET /student_rating_elements/1.json
  def show
  end

  # GET /student_rating_elements/new
  def new
    @student_rating_element = StudentRatingElement.new
  end

  # GET /student_rating_elements/1/edit
  def edit
  end

  # POST /student_rating_elements
  # POST /student_rating_elements.json
  def create
    @student_rating_element = StudentRatingElement.new(student_rating_element_params)

    respond_to do |format|
      if @student_rating_element.save
        format.html { redirect_to @student_rating_element, notice: 'Student rating element was successfully created.' }
        format.json { render :show, status: :created, location: @student_rating_element }
      else
        format.html { render :new }
        format.json { render json: @student_rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_rating_elements/1
  # PATCH/PUT /student_rating_elements/1.json
  def update
    respond_to do |format|
      if @student_rating_element.update(student_rating_element_params)
        format.html { redirect_to @student_rating_element, notice: 'Student rating element was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_rating_element }
      else
        format.html { render :edit }
        format.json { render json: @student_rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_rating_elements/1
  # DELETE /student_rating_elements/1.json
  def destroy
    @student_rating_element.destroy
    respond_to do |format|
      format.html { redirect_to student_rating_elements_url, notice: 'Student rating element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_rating_element
      @student_rating_element = StudentRatingElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_rating_element_params
      params.require(:student_rating_element).permit(:value)
    end
end
