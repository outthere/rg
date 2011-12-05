class CreateMenuPages < ActiveRecord::Migration
  def self.up
    create_table :menu_pages do |t|
      t.integer :manu_block_id
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_pages
  end
end
