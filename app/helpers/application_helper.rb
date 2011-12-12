module ApplicationHelper

  def language_selector
    html = '<ul class="lang">'

    used_langs = RefinerySetting.find_by_name( :i18n_translation_frontend_locales ).value
    used_langs_in_menu = RefinerySetting.find_by_name( :I18n_translation_frontend_locales_menu).value
    all_languages = RefinerySetting.find_by_name( :i18n_translation_locales ).value

    #puts " +++++++++++++++++++++++++ \n " + all_languages.inspect + "\n++++++++++++++++++++++\n"
    #all_languages.keys

    #all_languages.each do | key, value |
    used_langs_in_menu.each do |key|
      if all_languages.keys.include?(key)
        html << '<li'
        html << ' class="act"' if key == locale
        html << '><a href="'
        html << url_for(request.parameters.merge({:locale => key}))
        html << "\" >#{all_languages[key]}</a></li>"
      end
    end
    html << '</ul>'

    html.html_safe

  end

  def my_path(page_id)
    pg=Page.find_by_id(page_id)
    puts pg.inspect
    path_arr=[pg.id]
    while pg.parent_id != nil
      pg = pg.parent
      puts pg.inspect
      path_arr << pg.id
    end

    return path_arr.reverse
  end

  def page_template(page)
    page.template_name || parent_page_template(page)
  end

  def parent_page_template(page)
    if page.parent_id
      ppage=Page.find(page.parent_id)
      ppage.template_name || parent_page_template(ppage)
    end
  end

  def path_by_constant_name(constant_name)
    page=Page.find_by_constant_name(constant_name)
    page.url
  end

  def all_children_for_id(id, level)
    tmp_arr={}
    p=Page.in_menu.where(:parent_id => id ).order(:lft)
    p.each do |val|
      tmp_arr[val.id] = {:id => val.id, :title=> val.title, :level => level}
      tmp_arr = tmp_arr.merge( all_children_for_id(val.id, level+1 ) )
    end
    return tmp_arr
  end

  def link_block_show(name)
    html = '<ul>'
    mpages=MenuBlock.find_by_name(name).menu_pages
    mpages.each do |val|
#       html << "<li>" + Page.in_menu.where(:id => val.page_id).inspect + "</li>"
      if ptmp=@menu_pages.select { |p| p.id == val.page_id }.first


#      html << '<li><a href="'
#      html << url_for(request.parameters.merge({:locale => key}))
#      html << "\" >#{ptmp[:title]}</a></li>"

      html << '<li>'
      html << link_to(ptmp[:title], ptmp[:url]).to_s

      html << '</li>'
      end
    end
    html << '</ul>'
    html.html_safe
  end

end
