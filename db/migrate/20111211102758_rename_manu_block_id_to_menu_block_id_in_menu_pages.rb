class RenameManuBlockIdToMenuBlockIdInMenuPages < ActiveRecord::Migration
  def self.up
    rename_column :menu_pages, :manu_block_id, :menu_block_id
  end

  def self.down
    rename_column :menu_pages, :menu_block_id, :manu_block_id
  end
end
