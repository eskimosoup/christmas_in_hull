class OpeningTime < ActiveRecord::Base
  belongs_to :shopping_centre
  delegate :name, :to => :shopping_centre, :prefix => true

  validates_presence_of :shopping_centre
  validates_presence_of :date
  validates_presence_of :opening_hours
end
