if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'menu_blocks').blank?
      user.plugins.create(:name => 'menu_blocks',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Menu Blocks',
    :link_url => '/menu_blocks',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/menu_blocks(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end