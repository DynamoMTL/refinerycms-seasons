module SeasonsPagesControllerExtension
  extend ActiveSupport::Concern

  module InstanceMethods
  
    def home
      error_404 unless (@page = Season.current.pages.where(:link_url => '/').first).present?
    end
  end
end

