class AddHidePriceToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :hide_price, :boolean, :default => false
  end

  def self.down
    remove_column :events, :hide_price
  end
end
