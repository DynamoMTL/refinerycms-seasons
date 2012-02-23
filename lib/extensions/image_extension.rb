module ImageExtension
  extend ActiveSupport::Concern

  included do
    belongs_to :season
    attr_accessible :season_id
    before_validation :attach_to_season
  end

  module ClassMethods
    def in_season(season = Season.default.id)
      where(:season_id => season)
    end
  end
  
  module InstanceMethods
    def attach_to_season
      self.season_id = Season.current.id unless season_id.present?
    end
  end
end

::Image.send(:include, ImageExtension)
