require 'spec_helper'

describe Season do


  describe ".default" do
    let!(:old_season) { Factory(:old_season) }
    let!(:active_season) { Factory(:season) }
    let!(:future_season) { Factory(:future_season) }
    it "should return a season closest to today's date but and not in the future" do
      Season.default.should == active_season
    end
  end


end
