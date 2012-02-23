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
  page = Page.create(
    :title => 'Seasons',
    :link_url => '/seasons',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/seasons(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end

