class VenuesController < ApplicationController

  def index
    @venues = Venue.active.position
  end

  def show
    @venue = Venue.active.find(params[:id])
    redirect_to events_path(:venue => @venue.id) and return
  end

end