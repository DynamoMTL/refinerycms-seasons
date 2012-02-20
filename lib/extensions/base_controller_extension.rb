::Admin::BaseController.class_eval do
  
  before_filter :get_current_season

  private

  def get_current_season
    if params[:set_season]
      session[:current_season] = Season.find(params[:set_season])
      redirect_back_or_default(admin_root_path) and return
    else
      session[:current_season] ||= Season.default
    end
  end

end
