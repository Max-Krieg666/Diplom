class StudentRatingElementsController < ApplicationController
	before_action :check_user
  before_action :set_student_rating_element, only: [:edit, :update, :destroy]

  def new
    @student_rating_element = StudentRatingElement.new
    @student = User.find(params[:user_id])
    @discipline = Discipline.find(params[:discipline_id])
  end

  def edit
  end

  def create
    @student_rating_element = StudentRatingElement.new(student_rating_element_params)
		@rating_element = RatingElement.find(@student_rating_element.rating_element_id)
		respond_to do |format|
      if @student_rating_element.save
				format.html { redirect_to discipline_url(@rating_element.rating.discipline), notice: 'Баллы успешно начислены.' }
      else
        format.html { render :new }
        format.json { render json: @student_rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @student_rating_element.destroy
    respond_to do |format|
      format.html { redirect_to student_rating_elements_url, notice: 'Student rating element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
	def set_student_rating_element
		@student_rating_element = StudentRatingElement.find(params[:id])
	end

  def student_rating_element_params
		params.require(:student_rating_element).permit(:comment, :value, :rating_element_id, :user_id)
	end
end
