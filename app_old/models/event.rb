class Event < ActiveRecord::Base

  acts_as_eskimagical
  acts_as_taggable_on :tags

  validates_presence_of :start_date, :name
  validates_numericality_of :price

  validate :dates

  def dates
    # If the start date is ahead of end date.
    errors.add_to_base("Start date must be before the end date") if  (start_date > end_date)
    # If the dates are equivalent but the start time is ahead of the end time.
    errors.add_to_base("Start time must be before the end time") if ((start_date == end_date) && (start_time > end_time))
  end

  named_scope :position,              :order => "position"
  named_scope :upcoming,              :order => "start_date"
  named_scope :highlighted_upcoming, :order => "highlight DESC, start_date"
  named_scope :active,                :conditions => ["recycled = ? AND display = ? AND ((end_date IS NOT NULL AND end_date >= ?) OR (end_date IS NULL AND start_date >= ?))", false, true, Date.today, Date.today]
  named_scope :recycled,              :conditions => ["recycled = ?", true]
  named_scope :unrecycled,            :conditions => ["recycled = ?", false]
  named_scope :start_year,            lambda{ |year| { :conditions => ["year(start_date) = ?", year] } }
  named_scope :start_month,           lambda{ |month| { :conditions => ["month(start_date) = ?", month] } }
  named_scope :end_year,              lambda{ |year| { :conditions => ["year(end_date) = ?", year] } }
  named_scope :end_month,            lambda{ |month| { :conditions => ["month(end_date) = ?", month] } }
  named_scope :where_venue_is,        lambda{ |venue_id| { :conditions => ["venue_id = ?", venue_id.to_i] } }

  has_attached_image :image, :styles => {:thumbnail => "80x63#", :show => "250", :home_large => "294x116#"}
  has_images
  may_contain_images :main_content
  has_many :galleries, :dependent => :destroy

  before_validation do |event|
    if event.end_date.to_s.blank?
      event.end_date = event.start_date
    end
  end

  belongs_to :venue

  def active?
    return false if !display?
    return false if recycled?
    return false if (end_date? && end_date < Date.today)
    return false if (!end_date? && start_date < Date.today)
    true
  end

  def is_free?
    (price.to_f <= 0) ? true : false
  end

  def formatted_price
    !is_free? ? ApplicationController.helpers.number_to_pounds(price) : "<span class='red'>FREE</span>"
  end

  def has_proper_start_time?
    !(start_time.strftime("%H:%M") == "00:00")
  end

  def has_proper_end_time?
    !(end_time.strftime("%H:%M") == "23:59")
  end

  def self.years
    self.active.collect{|a| a.start_date.year}.uniq.sort
  end

  def self.months(year)
    self.active.start_year(year).collect{|a| a.start_date.month}.uniq.sort
  end

  def self.for_index
    self.active.highlighted_upcoming[0...6]
  end

end
