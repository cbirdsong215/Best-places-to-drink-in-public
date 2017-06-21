
class Api::V1::VotesController < ApplicationController

  def create
    review = Review.find(params[:review_id])

    current_vote = current_user.votes.where(review_id: review).first
    
    if current_vote == nil
      vote = Vote.create(review: review, user: current_user, status: params[:vote])

      render json: { total: review.total }
    elsif current_vote.status.to_s == params[:vote]
      current_vote.destroy
      render json: { total: review.total }
    else
      if params[:vote] == "true"
        current_vote.status = true
      else
        current_vote.status = false
      end
      current_vote.save
      render json: { total: review.total }
    end
  end

  def destroy
  end
end
