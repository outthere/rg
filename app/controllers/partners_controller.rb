class PartnersController < ApplicationController

  before_filter :find_all_partners
  before_filter :find_page

  def become_partner_thank_you
    @page = Page.find_by_link_url("/partners/become_partner_thank_you", :include => [:parts, :slugs])
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(params[:enrollment])

#    puts params[:partner]

    if @partner.save
      redirect_to become_partner_thank_you_partners_url
    else
      flash[:notice] = "Some error"
      render :action => 'new'
    end
  end


  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @partner in the line below:
    present(@page)
  end

  def show
    @partner = Partner.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @partner in the line below:
    present(@page)
  end

protected

  def find_all_partners
    @partners = Partner.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/partners").first
  end

end
