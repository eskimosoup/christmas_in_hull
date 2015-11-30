class Venue < ActiveRecord::Base

	acts_as_eskimagical

  validates_presence_of :name, :postcode

	named_scope :position, 	 :order => "position"
  named_scope :active, 		 :conditions => ["recycled = ? AND display = ?", false, true]
  named_scope :recycled,   :conditions => ["recycled = ?", true]
  named_scope :unrecycled, :conditions => ["recycled = ?", false]
  named_scope :arrange,    :order => "id"

  has_attached_image :image, :styles => {:index => "294x116#", :show => "250"}
  has_images

  has_many :events

  def active?
  	display? && !recycled?
  end

end
