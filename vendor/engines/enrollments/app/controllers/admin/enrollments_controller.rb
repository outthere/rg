module Admin
  class EnrollmentsController < Admin::BaseController

    crudify :enrollment,
            :title_attribute => 'name', :xhr_paging => true

  end
end
