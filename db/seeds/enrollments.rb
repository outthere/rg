if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'enrollments').blank?
      user.plugins.create(:name => 'enrollments',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Enrollments',
    :link_url => '/enrollments',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/enrollments(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end

  thank_you_for_enrolling_page = page.children.create({
    :title => "Thank You For Enrolling",
    :link_url => "/contact/thank_you_for_enrolling",
    :menu_match => "^/(inquiries|contact)/thank_you_for_enrolling$",
    :show_in_menu => false,
    :deletable => false,
  })
  thank_you_for_enrolling_page.parts.create({
    :title => "Body",
    :body => "<p>We will get back to you with a response shortly.</p><p><a href='/'>Return to the home page</a></p>",
    :position => 0
  })

end
