Admin::BaseController.class_eval do

  before_filter :get_current_season

  private

  def get_current_season
    session[:current_season] ||= Season.default
  end
  

end
