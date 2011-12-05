module ApplicationHelper

  def language_selector
    html = '<ul class="lang">'

    used_langs=RefinerySetting.find_by_name( :i18n_translation_frontend_locales ).value

    RefinerySetting.find_by_name( :i18n_translation_locales ).value.each do | key, value |
      if used_langs.include?(key)
        html << '<li'
        html << ' class="act"' if key == locale
        html << '><a href="'
        html << url_for(request.parameters.merge({:locale => key}))
        html << "\" >#{value}</a></li>"
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

    return path_arr
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
end
