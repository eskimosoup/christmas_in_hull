class NewsletterSubscriber < ActiveRecord::Base
  
  acts_as_eskimagical
  
  validates_presence_of :email
  validates_format_of   :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  named_scope :ordered, :order => "email"
  
end
