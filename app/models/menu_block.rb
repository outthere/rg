class MenuBlock < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :title]

  validates :name, :presence => true, :uniqueness => true

  has_many :user_pages
end
