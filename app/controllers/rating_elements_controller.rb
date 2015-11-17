class RatingElementsController < ApplicationController
  before_action :set_rating_element, only: [:show, :edit, :update, :destroy]

  # GET /rating_elements
  # GET /rating_elements.json
  def index
    @rating_elements = RatingElement.all
  end

  # GET /rating_elements/1
  # GET /rating_elements/1.json
  def show
  end

  # GET /rating_elements/new
  def new
    @rating_element = RatingElement.new
  end

  # GET /rating_elements/1/edit
  def edit
  end

  # POST /rating_elements
  # POST /rating_elements.json
  def create
    @rating_element = RatingElement.new(rating_element_params)

    respond_to do |format|
      if @rating_element.save
        format.html { redirect_to @rating_element, notice: 'Rating element was successfully created.' }
        format.json { render :show, status: :created, location: @rating_element }
      else
        format.html { render :new }
        format.json { render json: @rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rating_elements/1
  # PATCH/PUT /rating_elements/1.json
  def update
    respond_to do |format|
      if @rating_element.update(rating_element_params)
        format.html { redirect_to @rating_element, notice: 'Rating element was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating_element }
      else
        format.html { render :edit }
        format.json { render json: @rating_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_elements/1
  # DELETE /rating_elements/1.json
  def destroy
    @rating_element.destroy
    respond_to do |format|
      format.html { redirect_to rating_elements_url, notice: 'Rating element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating_element
      @rating_element = RatingElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_element_params
      params.require(:rating_element).permit(:title, :score)
    end
end
