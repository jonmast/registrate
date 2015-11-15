class ListingsController < ApplicationController
  def create
    @listing = Listing.create(listing_params)
    redirect_to @listing
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:price, :description, :animal_id)
  end
end
