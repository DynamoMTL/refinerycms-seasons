require 'spec_helper'

describe Page do

  it { should belong_to(:season) }

  describe ".in_season" do

    it 'should return pages for a specific season' do
      spring = Factory(:season, :name => 'Spring')
      fall = Factory(:season, :name => 'Fall')
      spring_home = Factory.create(:page, :season_id => spring.id)
      fall_home = Factory.create(:page, :season_id => fall.id)
      
      Page.in_season(spring.id).should include spring_home
      Page.in_season(spring.id).should_not include fall_home
    end

  end

end
