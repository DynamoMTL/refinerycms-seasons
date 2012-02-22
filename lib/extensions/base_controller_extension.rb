::Admin::BaseController.class_eval do
  
  before_filter :set_season
  private

  def set_season
    if params[:set_season]
      session[:current_season] = Season.find(params[:set_season])
    else
      session[:current_season] ||= Season.default 
    end
  end

end
