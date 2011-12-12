class Partner < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :company, :position, :cooperation, :email, :phone]

  validates :name, :presence => true,
            :length => { :maximum => 255 }
  validates :company, :presence => true,
            :length => { :maximum => 255 }
  validates :email, :presence => true,
            :length => { :minimum => 6, :maximum => 255 },
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :phone, :presence => true,
            :length => { :maximum => 255 }

  
end
