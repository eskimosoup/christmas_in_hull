class CreateVenues < ActiveRecord::Migration
  
  def self.up
    create_table(:venues) do |t|
      t.string 	 :name
      t.string   :image_file_name
      t.string 	 :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string   :image_alt
      t.text     :address
      t.string   :postcode
      t.integer  :created_by
      t.integer  :updated_by
      t.boolean  :recycled, :default => false
      t.datetime :recycled_at
      t.boolean  :display, :default => true
      t.integer  :position, :default => 0
      t.timestamps
    end
  end
  
  def self.down
    drop_table(:venues)
  end
  
end