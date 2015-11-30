class AddLinkIdToPageContents < ActiveRecord::Migration
  def self.up
    add_column :page_contents, :link, :string
  end

  def self.down
    remove_column :page_contents, :link
  end
end
