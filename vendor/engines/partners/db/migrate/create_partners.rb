class CreatePartners < ActiveRecord::Migration

  def self.up
    create_table :partners do |t|
      t.string :name
      t.string :company
      t.string :position
      t.string :cooperation
      t.string :email
      t.string :phone
      t.integer :position

      t.timestamps
    end

    add_index :partners, :id

    load(Rails.root.join('db', 'seeds', 'partners.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "partners"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/partners"})
    end

    drop_table :partners
  end

end
