module ImageExtension
  extend ActiveSupport::Concern

  included do
    belongs_to :season
  end
end

::Image.send(:include, ImageExtension)
