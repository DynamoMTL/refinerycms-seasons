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
