class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :event_id, :null => false	    
      t.string :name, :null => false
      t.text :summary
      t.boolean :display, :default => true
      t.integer :position, :default => 0
      t.integer :gallery_images_count, :default => 0
      t.timestamps
    end
    add_index :galleries, :name, :unique => true
    add_index :galleries, :event_id
  end

  def self.down
    drop_table :galleries
  end
end
