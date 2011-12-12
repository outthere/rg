module Admin
  class MenuBlocksController < Admin::BaseController

    crudify :menu_block,
            :title_attribute => 'name', :xhr_paging => true

    def create
      puts params

      @menu_block = MenuBlock.new(params[:menu_block])

       if @menu_block.save
         @menu_block.page_ids=params[:menu_pages]? params[:menu_pages].collect {|x| x.to_i } : []
         flash[:notice] = t('menu_block.update_ok')
         redirect_to admin_menu_blocks_path
       else
         respond_to do |format|
           format.html  { render :action => "edit" }
           format.json  { render :json => @menu_block.errors }
         end
       end

    end


    def update
      puts params

      @menu_block = MenuBlock.find(params[:id])

       if @menu_block.update_attributes(params[:menu_block])
         @menu_block.page_ids=params[:menu_pages]? params[:menu_pages].collect {|x| x.to_i } : []
         flash[:notice] = t('menu_block.update_ok')
         redirect_to admin_menu_blocks_path
       else
         respond_to do |format|
           format.html  { render :action => "edit" }
           format.json  { render :json => @menu_block.errors }
         end
       end

    end

  end
end
