class CreateOpeningTimes < ActiveRecord::Migration
  def self.up
    create_table :opening_times do |t|
      t.date :date, :null => false
      t.string :opening_hours, :null => false
      t.belongs_to :shopping_centre, :null => false
      t.boolean :display, :default => true

      t.timestamps
    end
    add_index :opening_times, :shopping_centre_id
  end

  def self.down
    drop_table :opening_times
  end
end
