Before('@seasons') do
  spring = Factory(:season, :name => 'Spring')
  fall = Factory(:season, :name => 'Fall')
  future = Factory(:future_season, :name => 'Future')
end
