class ReviewsController < ApplicationController

  def create
    parent = Product.find(params[:product_id])
    user_id = User.find(session[:user_id]).id if session[:user_id]
    review1 = parent.reviews.new(review_params)
    review1.user_id = user_id
    # @review.user = current_user
    # puts @review.user

    if !review1.save
      puts "Error! Review failed to save."
    end

    redirect_to parent
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
