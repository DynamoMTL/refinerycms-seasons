Given /^I have no seasons$/ do
  Season.delete_all
end


Then /^I should have ([0-9]+) seasons?$/ do |count|
  Season.count.should == count.to_i
end

Given /^I have active seasons$/ do
  Season.count.should be > 0
end

Then /^"([^"]*)" should be the current season$/ do |season|
  within "ul#current_season" do
    page.should have_content(season)
  end
end

Then /^"([^"]*)" should not be the current season$/ do |season|
  within "ul#current_season" do
    page.should_not have_content(season)
  end
end

Given /^"([^"]*)" is the current season$/ do |season|
  @season = Season.find_by_name(season)
end

Then /^the page should belong to season "([^"]*)"$/ do |season|
  Page.last.season.should == Season.find_by_name(season)
end

Given /^the following pages exist:$/ do |table|
  table.hashes.map do |hash|
    Factory(:page, :title => hash["title"], 
            :season_id => Season.find_by_name(hash["season"]).id)
  end

end

Given /^I have a page titled "([^"]*)" with a custom url "([^"]*)" and belonging to the "([^"]*)" season$/ do |title, link_url, season|
  Factory(:page, :title => title, :link_url => link_url, :season_id => Season.find_by_name(season).id)
end

When /^I visit the admin area$/ do
  visit("/refinery")
end

Given /^I have chosen a default season$/ do
  visit("/seasons")
  click_link(Season.default.name)
  
end

Given /^I have chosen "([^"]*)" as my season$/ do |season|
  visit("/seasons")
  click_link(season)
end



