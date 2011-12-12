class AddResumeToEnrollments < ActiveRecord::Migration
  def self.up
    add_column :enrollments, :resume_file_name, :string
    add_column :enrollments, :resume_content_type, :string
    add_column :enrollments, :resume_file_size, :integer
    add_column :enrollments, :resume_updated_at, :datetime
  end

  def self.down
    remove_column :enrollments, :resume_updated_at
    remove_column :enrollments, :resume_file_size
    remove_column :enrollments, :resume_content_type
    remove_column :enrollments, :resume_file_name
  end
end
