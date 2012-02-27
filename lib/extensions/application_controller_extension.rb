module ApplicationControllerExtension
  extend ActiveSupport::Concern

 included do
   prepend_before_filter :get_season, :if => :current_user
   prepend_before_filter :set_season, :if => Proc.new { |c| current_user and params[:set_season] }
 end
  

  module InstanceMethods
    
    protected

    def get_season
     redirect_to seasons_path unless session[:current_season]
     Season.current = session[:current_season]
   end

   def set_season
     Rails.cache.clear
     session[:current_season] = Season.find(params[:set_season])
   end

  private

    def find_pages_for_menu
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

