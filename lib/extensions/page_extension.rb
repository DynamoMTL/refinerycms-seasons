module PageExtension
  extend ActiveSupport::Concern

  included do
    belongs_to :season
    attr_accessible :season_id
    validates_presence_of :season_id
  end
end

::Page.send(:include, PageExtension)
