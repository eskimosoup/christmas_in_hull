class RemoveParentIdFromPageNodes < ActiveRecord::Migration
  def self.up
    remove_column :page_nodes, :parent_id
    add_column :page_nodes, :ancestry, :string
  end

  def self.down
    add_column :page_nodes, :parent_id, :integer
    remove_column :page_nodes, :ancestry
  end
end
