::Admin::DashboardHelper.module_eval do

  def current_season
    session[:current_season] || Season.default
  end

end
