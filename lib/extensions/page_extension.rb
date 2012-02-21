module PageExtension
  extend ActiveSupport::Concern

  included do
    belongs_to :season
  end
end

::Page.send(:include, PageExtension)
