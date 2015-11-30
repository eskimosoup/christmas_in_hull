class CreateNewsletterSubscribers < ActiveRecord::Migration
  
  def self.up
    create_table :newsletter_subscribers do |t|
      t.string   :email
      t.integer  :created_by
      t.integer  :updated_by
      t.boolean  :recycled, :default => false
      t.datetime :recycled_at
      t.boolean  :display,  :default => true
      t.integer  :position, :default => 0
      t.timestamps
    end
  end
  
  def self.down
    drop_table :newsletter_subscribers
  end
  
end
