FactoryGirl.define do
  factory :season do
    name 'Current Season'
    active true
    start_date 2.months.ago
  end

  factory :future_season, :parent => :season do
    start_date Time.now.advance(months: 1)
    name "Future Season"
  end

  factory :old_season, :parent => :season do
    start_date 3.months.ago
    name "Old Season"
  end

  factory :page do
    title 'my great page'
    association :season, :factory => :old_season
  end
end
