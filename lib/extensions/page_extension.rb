module PageExtension
  extend ActiveSupport::Concern

  included do
    belongs_to :season
    attr_accessible :season_id
    validates_presence_of :season_id
  end

  module ClassMethods
    def in_season(season = Season.default.id)
      where(:season_id => season)
    end
  end
end

::Page.send(:include, PageExtension)
