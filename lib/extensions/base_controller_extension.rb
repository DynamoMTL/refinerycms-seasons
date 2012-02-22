::Admin::BaseController.class_eval do
  
  before_filter :set_season
  private

  def set_season
    if params[:set_season]
      @season, session[:current_season] = Season.find(params[:set_season])
    else
      @season = session[:current_season].nil? ? Season.default : session[:current_season]
    end
  end


end
