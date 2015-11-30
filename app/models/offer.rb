class Offer < ActiveRecord::Base
	
	
	validates_presence_of :company_name, :summary, :postcode, :address
	
	has_attached_image :image, :styles => {:show => "400"}
	has_attached_image :logo, :styles => {:thumbnail => "100x100#", :show => "250"},
	:convert_options => { :thumbnail => "-liquid-rescale 100x100%\!" }
  has_images
  may_contain_images :description
	
  before_save :check_url
  
  def check_url
  	unless self.website.start_with?("http://", "https://")
  		self.website = "http://" + self.website
  	end
  end
	
end
