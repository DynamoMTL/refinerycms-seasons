Given /^I have no seasons$/ do
  Season.delete_all
end


Then /^I should have ([0-9]+) seasons?$/ do |count|
  Season.count.should == count.to_i
end

Given /^I have active seasons$/ do
  spring = Factory(:season, :name => 'Spring')
  fall = Factory(:season, :name => 'Fall')
  future = Factory(:future_season, :name => 'Future')
end
