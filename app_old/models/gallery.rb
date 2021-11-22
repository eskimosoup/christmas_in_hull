class Gallery < ActiveRecord::Base
  belongs_to :event
  has_many :gallery_images, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
