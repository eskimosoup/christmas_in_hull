class AddUniqueIndexToOpeningTimes < ActiveRecord::Migration
  def self.up
    add_index :opening_times, [:shopping_centre_id, :date], :unique => true
  end

  def self.down
    remove_index :opening_times, [:shopping_centre_id, :date]
  end
end
