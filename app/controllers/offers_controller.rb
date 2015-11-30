class OffersController < ApplicationController
 
  def index
    @offers = Offer.all(:conditions => ["display = ?", true])
  end

  def show
    @offer = Offer.find(params[:id])
  end

end
