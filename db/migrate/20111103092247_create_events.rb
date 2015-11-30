class CreateEvents < ActiveRecord::Migration
	
  def self.up
    create_table(:events) do |t|
      t.string   :name
      t.integer  :venue_id
      t.text     :summary
      t.text     :main_content
      t.text     :booking_information
      t.date     :start_date
      t.time     :start_time
      t.date     :end_date
      t.time     :end_time
      t.decimal  :price, :precision => 5, :scale => 2, :default => 0.00
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string   :image_alt
      t.integer  :created_by
      t.integer  :updated_by
      t.boolean  :recycled, :default => false
      t.datetime :recycled_at
      t.boolean  :display, :default => true
      t.integer  :position, :default => 0
      t.boolean  :highlight, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table(:events)
  end
  
end
