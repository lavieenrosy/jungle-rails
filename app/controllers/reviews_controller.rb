class ReviewsController < ApplicationController

  before_action :require_login

  def create
    parent = Product.find(params[:product_id])
    user_id = User.find(session[:user_id]).id if session[:user_id]
    review1 = parent.reviews.new(review_params)
    review1.user_id = user_id

    if !review1.save
      puts "Error! Review failed to save."
    end

    redirect_to parent
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @review.product
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def require_login
    puts current_user
    if !current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to product_path
    end
  end

end
