class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :company_name
      t.text :summary
      t.string :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at
      t.string   :logo_alt
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string   :image_alt
      t.text :description
      t.string :website
      t.text :address
      t.string :postcode
      t.boolean  :display, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
