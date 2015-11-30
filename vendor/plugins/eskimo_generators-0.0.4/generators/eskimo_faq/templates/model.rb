class <%= class_name %> < ActiveRecord::Base
	
  acts_as_eskimagical
	acts_as_taggable_on :tags
  
	named_scope :position, :order => "position"
  named_scope :active, :conditions => ["recycled = ? AND display = ?", false, true]
  named_scope :recycled, :conditions => ["recycled = ?", true]
  named_scope :unrecycled, :conditions => ["recycled = ?", false]
    
  def active?
  	display? && !recycled?
  end
  
  def name
    question
  end
  
  def summary
    answer
  end  
  
  def self.generate(count=1)
    count.times do
      item = self.new
      item.question = Faker::Lorem.sentence
      item.answer = Faker::Lorem.sentences(rand(10)+1).join('  ')
      puts item.save
    end
  end 
  
end
