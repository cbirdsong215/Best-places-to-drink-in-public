class FoodsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all
  end

  def show
  end

  def new
    @food = Food.new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Successfully created.' }
        format.json { render :show, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(review_params)
        format.html { redirect_to @food, notice: 'Successfully updated.' }
        format.json { render :show, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors }
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:food).permit(:name, :description, :photo, :user_id)
    end
end
