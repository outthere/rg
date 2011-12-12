class EnrollmentsController < ApplicationController

  before_filter :find_page, :only => [:create, :new]
  before_filter :find_all_menu_blocks

  def thank_you_for_enrolling
    @page = Page.find_by_link_url("/contact/thank_you_for_enrolling", :include => [:parts, :slugs])
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(params[:enrollment])

    puts params[:enrollment]

    if @enrollment.save
      redirect_to thank_you_for_enrolling_enrollments_url
    else
      flash[:notice] = "Some error"
      render :action => 'new'
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @menu_block in the line below:
    present(@page)
  end

protected

  def find_all_menu_blocks
    @menu_blocks = MenuBlock.order('position ASC')
  end

  def find_page
    @page = Page.find_by_link_url('/enrollments', :include => [:parts, :slugs])
  end



end
