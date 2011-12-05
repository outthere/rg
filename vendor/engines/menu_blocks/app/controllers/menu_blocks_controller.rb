class MenuBlocksController < ApplicationController

  before_filter :find_all_menu_blocks
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @menu_block in the line below:
    present(@page)
  end

  def show
    @menu_block = MenuBlock.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @menu_block in the line below:
    present(@page)
  end

protected

  def find_all_menu_blocks
    @menu_blocks = MenuBlock.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/menu_blocks").first
  end

end
