class SeasonsController < ApplicationController

  before_filter :find_all_seasons
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @season in the line below:
    present(@page)
  end

  def show
    @season = Season.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @season in the line below:
    present(@page)
  end

protected

  def find_all_seasons
    @seasons = Season.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/seasons").first
  end

end
