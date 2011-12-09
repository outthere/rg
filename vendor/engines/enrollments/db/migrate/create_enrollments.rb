class CreateEnrollments < ActiveRecord::Migration

  def self.up
    create_table :enrollments do |t|
      t.string :name
      t.string :place
      t.string :program_type
      t.string :when_to_start
      t.integer :resume_id
      t.string :phone
      t.text :comment
      t.integer :position

      t.timestamps
    end

    add_index :enrollments, :id

    load(Rails.root.join('db', 'seeds', 'enrollments.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "enrollments"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/enrollments"})
    end

    drop_table :enrollments
  end

end
