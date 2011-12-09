class EnrollmentsController < ApplicationController

  before_filter :find_all_enrollments
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @enrollment in the line below:
    present(@page)
  end

  def show
    @enrollment = Enrollment.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @enrollment in the line below:
    present(@page)
  end

protected

  def find_all_enrollments
    @enrollments = Enrollment.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/enrollments").first
  end

end
