module Admin
  class PartnersController < Admin::BaseController

    crudify :partner,
            :title_attribute => 'name', :xhr_paging => true

  end
end
