class CreateMenuBlocks < ActiveRecord::Migration

  def self.up
    create_table :menu_blocks do |t|
      t.string :name
      t.string :title
      t.integer :deletable
      t.integer :position

      t.timestamps
    end

    add_index :menu_blocks, :id

    load(Rails.root.join('db', 'seeds', 'menu_blocks.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "menu_blocks"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/menu_blocks"})
    end

    drop_table :menu_blocks
  end

end
