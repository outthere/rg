class Enrollment < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :place, :program_type, :when_to_start, :phone, :comment]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :resume, :class_name => 'Resource'
end
