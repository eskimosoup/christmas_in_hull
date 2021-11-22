class Gallery < ActiveRecord::Base

  has_many :gallery_images, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
