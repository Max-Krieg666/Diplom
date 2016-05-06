class RatingElementsController < ApplicationController
	before_action :check_user
  before_action :set_rating_element, only: [:show, :edit, :update, :destroy]
	before_action :set_rating, only: [:show, :new, :create]

  def show
  end

  def new
    @rating_element = RatingElement.new
  end

  def edit
  end

  def create
    @rating_element = RatingElement.new(rating_element_params)

    respond_to do |format|
      if @rating_element.save
        usrs = @rating_element.rating.discipline.group.users.where(role: 0)
        usrs.each do |us|
          StudentRatingElement.create(user_id: us.id, rating_element_id: @rating_element.id)
        end
        format.html { redirect_to @rating_element, notice: 'Создан элемент рейтинга.' }
        format.json { render :show, status: :created, location: @rating_element }
      else
        format.html { render :new }
        format.json { render json: @rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rating_element.update(rating_element_params)
        format.html { redirect_to @rating_element, notice: 'Элемент рейтинга изменен.' }
        format.json { render :show, status: :ok, location: @rating_element }
      else
        format.html { render :edit }
        format.json { render json: @rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating_element.destroy
    respond_to do |format|
      format.html { redirect_to rating_elements_url, notice: 'Элемент рейтинга удален.' }
      format.json { head :no_content }
    end
  end

  private
	def set_rating_element
		@rating_element = RatingElement.find(params[:id])
	end

	def rating_element_params
    return [] unless params[:rating_element]
		params.require(:rating_element).permit(:title, :score, :rating_id)
	end

	def set_rating
		@rating = if params[:rating_id].present?
		  Rating.find(params[:rating_id])
		elsif !rating_element_params.blank? && rating_element_params[:rating_id].present?
			Rating.find(rating_element_params[:rating_id])
		else
			@rating_element.rating
		end
	end
end
