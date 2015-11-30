class <%= class_name %> < ActiveRecord::Base
	
  acts_as_eskimagical
	acts_as_taggable_on :tags
	
	validates_presence_of :quote
  
	named_scope :position, :order => "position"
  named_scope :active, :conditions => ["recycled = ? AND display = ?", false, true]
  named_scope :recycled, :conditions => ["recycled = ?", true]
  named_scope :unrecycled, :conditions => ["recycled = ?", false]
    
  def active?
  	display? && !recycled?
  end
  
  def name
    author
  end
  
  def summary
    quote
  end  
  
  def self.generate(count=1)
    count.times do
      item = self.new
      item.quote = Faker::Lorem.sentences(rand(10)+1).join('  ')
      item.author = Faker::Name.name
      item.company_name = Faker::Name.last_name if (rand(2) == 0)
      puts item.save
    end
  end 
  
end
