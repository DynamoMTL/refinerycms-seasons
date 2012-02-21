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
  @current_season = Season.find_by_name(season)
end

Then /^the page should belong to season "([^"]*)"$/ do |season|
  Page.last.season.should == Season.find_by_name(season)
end
