if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'partners').blank?
      user.plugins.create(:name => 'partners',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Partners',
    :link_url => '/partners',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/partners(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end

  become_partner_thank_you_page = page.children.create({
    :title => "Thank You For Enrolling",
    :link_url => "/contact/become_partner_thank_you",
    :menu_match => "^/(inquiries|contact)/become_partner_thank_you$",
    :show_in_menu => false,
    :deletable => false,
  })
  become_partner_thank_you_page.parts.create({
    :title => "Body",
    :body => "<p>Hello, future partner :) We will get back to you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>",
    :position => 0
  })

end
