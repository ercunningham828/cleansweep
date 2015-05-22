class ReviewsController < ApplicationController
  def new
    @review=Review.new
    @booking=Booking.find(params[:format])
  end

  def create
    @booking=Booking.find(params[:review][:booking_id])
    @review=Review.create(review_params)
    @score=params[:score]
    @review.overall_rating=@score
    @review.booking=@booking
    
    if @review.save
       flash[:notice] = "Review was saved."
       redirect_to root_path(tab:"bookings", subtab:"completed")
     else
       flash[:error] = "There was an error saving the review. Please try again."
       render :new
     end
  end

  private

  def review_params
    params.require(:review).permit(:booking,:overall_rating,:comments)
  end
end
