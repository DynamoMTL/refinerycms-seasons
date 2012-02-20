Given /^I have no seasons$/ do
  Season.delete_all
end


Then /^I should have ([0-9]+) seasons?$/ do |count|
  Season.count.should == count.to_i
end

Given /^I have active seasons$/ do
  Season.count.should be > 0
end

When /^I select "([^"]*)" from the season selector$/ do |season|
  select(season, :from => 'seasons')
end
