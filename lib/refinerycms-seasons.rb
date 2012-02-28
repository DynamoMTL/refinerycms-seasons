require 'refinerycms-base'

module Refinery
  module Seasons

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.to_prepare do
        Dir.glob(File.join(Refinery::Seasons.root, "lib/extensions/**/*.rb")) do |c|
          Rails.env.production? ? require(c) : load(c)
        end
      end
      
      refinery.after_inclusion do
        ::ApplicationController.send(:include, ApplicationControllerExtension)
        ::Admin::PagesController.class_eval do
          
          def find_all_pages
            @pages = Page.where(:season_id => Season.current)
                         .includes([:slugs, :translations, :children])
                         .order("lft ASC")
          end
        end
        ::Admin::ImagesController.class_eval do
          
          def find_all_images(conditions = {})
            @images = Image.where(:season_id => Season.current).order("created_at DESC")
          end
        end
      end
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "seasons"
          plugin.pathname = root
          plugin.activity = {
            :class => Season
          }
        end
        
      end
    end
  end
end
