if defined?(Season)
  season = Season.create(
    :name => 'Fall/Winter 2012/13', 
    :start_date => 3.months.ago,
    :active => true
  )

Season.current = season
end
if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'seasons').blank?
      user.plugins.create(:name => 'seasons',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  
  Page.update_all("season_id = #{season.id}")
  Image.update_all("season_id = #{season.id}")
end

