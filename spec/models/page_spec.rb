require 'spec_helper'

describe Page do

  it { should belong_to(:season) }
  it { should validate_presence_of(:season_id) }

  describe ".in_season" do
    spring = Factory(:season, :name => 'Spring')
    fall = Factory(:season, :name => 'Fall')
    spring_home = Factory(:page, :season_id => spring.id)
    fall_home = Factory(:page, :season_id => fall.id)
    
    it 'should return pages for a specific season' do
      Page.in_season(spring.id).should include spring_home
      Page.in_season(spring.id).should_not include fall_home
    end

  end

end
