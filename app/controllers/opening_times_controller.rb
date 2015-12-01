class OpeningTimesController < ApplicationController

  def index
    @opening_times = OpeningTime.all(:include => :shopping_centre, :conditions => ["date >= ? AND display = ?", Date.today, true], :order => "date ASC")
  end

end