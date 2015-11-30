class Banner < ActiveRecord::Base

	acts_as_eskimagical

  validates_presence_of :name

	named_scope :position, :order => "position"
  named_scope :active, :conditions => ["recycled = ? AND display = ?", false, true]
  named_scope :recycled, :conditions => ["recycled = ?", true]
  named_scope :unrecycled, :conditions => ["recycled = ?", false]
  named_scope :arrange, :order => "id"

  belongs_to :article
  belongs_to :event
  belongs_to :page_node, :class_name => "PageNode", :foreign_key => :page_id
  belongs_to :venue

  has_attached_image :image, :styles => {:thumbnail => "80x63#", :large => "668x263#"}
	has_attached_image :alt_image, :styles => {:thumbnail => "80x63#", :large => "668x263#"}
  has_images

  def active?
  	display? && !recycled?
  end

  def self.for_index
		self.active.position.reject{|banner| !banner.image?}[0...3]
  end

end
