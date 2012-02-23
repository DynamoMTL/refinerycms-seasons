module ApplicationControllerExtension
  extend ActiveSupport::Concern

  module InstanceMethods
    
    protected

    def get_or_set_season
      if params[:set_season]
        session[:current_season] = Season.find(params[:set_season])
      else
        session[:current_season] ||= Season.default 
      end
      Season.current = session[:current_season]
    end

  private
    def find_pages_for_menu
      get_or_set_season
      # scope the find for the current season
      pages = ::Page.in_season(Season.current).live.in_menu.includes(:slug).order('lft ASC')

      # Now we only want to select particular columns to avoid any further queries.
      # Title is retrieved in the next block below so it's not here.
      %w(id depth parent_id lft rgt link_url menu_match).each do |column|
        pages = pages.select(::Page.arel_table[column.to_sym])
      end

      # If we have translations then we get the title from that table.
      if ::Page.respond_to?(:translation_class)
        pages = pages.joins(:translations).select("#{::Page.translation_class.table_name}.title as page_title")
      else
        pages = pages.select('title as page_title')
      end

      # Compile the menu
      @menu_pages = ::Refinery::Menu.new(pages)
      
    end
  end
end

