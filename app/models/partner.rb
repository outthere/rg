class Partner < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :company, :position, :cooperation, :email, :phone]

  validates :name, :presence => true, :uniqueness => true
  
end
