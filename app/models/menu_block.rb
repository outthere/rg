class MenuBlock < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :title]

  validates :name, :presence => true, :uniqueness => true

  has_many  :menu_pages, :dependent => :destroy
  has_many  :pages, :through => :menu_pages


  def page_ids
     self.menu_pages.map(&:page_id)
  end

  def page_ids=(new_ids)
     new_ids = (new_ids || []).reject(&:blank?)
     old_ids = self.page_ids

     #self.transaction do
       MenuPage.destroy_all({ :page_id => old_ids, :menu_block_id => self.id })
       new_ids.each do |page_id|
         self.menu_pages.create!(:page_id => page_id)
       end
     #end
  end

end
