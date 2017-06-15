class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all.order('created_at DESC')
  end
end
