module Admin
  class MenuBlocksController < Admin::BaseController

    crudify :menu_block,
            :title_attribute => 'name', :xhr_paging => true

  end
end
