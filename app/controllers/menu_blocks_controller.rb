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

  def new
    @menu_block =MenuBlock.new
  end

  def create
    @menu_block =MenuBlock.new(params[:menu_block])

    if @meetup.save
      flash[:notice] = t('meetup.create_ok')
      redirect_to admin_meetups_url
    else
      respond_to do |format|
        format.html  { render :action => "new" }
        format.json  { head :ok }
      end
    end


  end

protected

  def find_all_menu_blocks
    @menu_blocks = MenuBlock.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/menu_blocks").first
  end

end
