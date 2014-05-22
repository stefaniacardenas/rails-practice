class ReviewsController < ApplicationController

  # def new
  # 	@restaurant = Restaurant.find(params[:restaurant_id])
  # 	@review = Review.new
  # end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@review = @restaurant.reviews.new(params[:review].permit(:comments, :rating))
  	if @review.save
  		redirect_to '/restaurants'
  	else
  		flash[:notice] = "Invalid review"
  		redirect_to '/restaurants'
  	end
  end

end
