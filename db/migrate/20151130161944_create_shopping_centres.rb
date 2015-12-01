class CreateShoppingCentres < ActiveRecord::Migration
  def self.up
    create_table :shopping_centres do |t|
      t.string :name
      t.boolean :display, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :shopping_centres
  end
end
