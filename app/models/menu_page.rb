class MenuPage < ActiveRecord::Base
  belongs_to :menu_block
  has_one :page

end
