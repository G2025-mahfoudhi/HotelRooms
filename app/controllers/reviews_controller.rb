class ReviewsController < ApplicationController
   before_action :authenticate_user!
  def create
     @hotel = Hotel.find(params[:hotel_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.hotel = @hotel
    if @review.save
      redirect_to hotel_path(@hotel), notice: "Avis ajouté !"
    else
      redirect_to hotel_path(@hotel), alert: "Erreur lors de l'ajout de l'avis."
    end
  end
   private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
