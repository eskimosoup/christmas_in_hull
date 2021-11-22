class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  validates_attachment_presence :image

  has_attached_image :image, :styles => { :thumbnail => "80x63#", :small => "150x150>", :large => "800x600>" }
  has_images
end
