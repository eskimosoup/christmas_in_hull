class EventsController < ApplicationController

  def index
    params[:page] ||= 1
    @title = "Events"
    if params[:venue]
      @venue = Venue.find(params[:venue])
      @title += ": #{@venue.name}"
      @search = Event.active.where_venue_is(@venue.id)
    else
      @search = Event.active
    end
    @events = @search.upcoming.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @event = Event.find(params[:id])
    @venue = @event.venue
    unless @event.active?
      redirect_to events_path
    end
  end

end
