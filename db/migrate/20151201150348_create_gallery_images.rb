class CreateGalleryImages < ActiveRecord::Migration
  def self.up
    create_table :gallery_images do |t|
      t.belongs_to :gallery, :null => false
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string :image_alt
      t.integer :position, :default => 0
      t.boolean :display, :default => true

      t.timestamps
    end
    add_index :gallery_images, :gallery_id
  end

  def self.down
    drop_table :gallery_images
  end
end
