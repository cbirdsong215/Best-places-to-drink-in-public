class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

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
    if @food.save
      flash[:alert] = "Food added successfully"
      redirect_to food_path(@food)
    else
      flash[:alert] = @food.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Successfully updated.' }
        format.json { render :show, location: @food }
      else
        flash[:alert] = @food.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @food.errors }
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to food_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :description, :photo, :user_id).merge(user_id: current_user.id)
    end

    def editable_by?(user)
      user == self.user || user.try(:admin?)
    end

    def destroyable_by?(user)
      user.admin?
    end

end
