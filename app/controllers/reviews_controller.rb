class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @review = Review.new
    @food = Food.find(params[:food_id])
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @food = Food.find(params[:food_id])
    respond_to do |format|
      if @review.save
        format.html { redirect_to @food, notice: 'Review was successfully created.' }
        format.json { render :show, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :body, :user_id, :food_id).merge(user_id: current_user.id)
    end
end
