class AddEmailToEnrollments < ActiveRecord::Migration
  def self.up
    add_column :enrollments, :email, :string
  end

  def self.down
    remove_column :enrollments, :email
  end
end
