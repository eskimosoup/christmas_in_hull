class OpeningTimesController < ApplicationController

  def index
    @opening_times = OpeningTime.all(:include => :shopping_centre, :joins => :shopping_centre,
         :conditions => ["date >= ? AND shopping_centres.display = ? AND opening_times.display = ?", Date.today, true, true],
                                     :order => "date ASC, shopping_centres.name ASC")
  end

end
