::Admin::BaseController.class_eval do
  
  before_filter :set_season
  before_filter :get_current_season
  private

  def set_season
    return unless params[:set_season]
    @season, session[:current_season] = Season.find(params[:set_season])
  end

  def get_current_season
    @season = session[:current_season].nil? ? Season.default : session[:current_season]
  end

end
