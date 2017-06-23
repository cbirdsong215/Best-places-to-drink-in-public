class ReviewsController < ApplicationController
  before_action only: [:show, :destroy]

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
        flash[:alert] = @review.errors.full_messages.to_sentence
        format.html { render :new }
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
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :body, :user_id, :food_id).merge(user_id: current_user.id)
    end
end
