class CreateBanners < ActiveRecord::Migration
	
  def self.up
    create_table(:banners) do |t|
      t.string   :name
      t.text     :content
      t.integer  :article_id, :null => true
			t.integer  :event_id, :null => true
      t.integer  :page_id, :null => true
      t.integer  :venue_id, :null => true
      t.string   :external_link
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
			t.timestamps
    end
  end
  
  def self.down
    drop_table(:banners)
  end
  
end