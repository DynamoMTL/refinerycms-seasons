require 'spec_helper'

describe Season do

  it { should have_many(:pages) }
  it { should have_many(:images) }

  describe ".default" do
    let!(:old_season) { Factory(:old_season) }
    let!(:active_season) { Factory(:season) }
    let!(:future_season) { Factory(:future_season) }
    it "should return a season closest to today's date but and not in the future" do
      Season.default.should == active_season
    end
  end

  describe "#copy_page_structure_from_default_season" do
    before(:each) do
      default_season = Factory(:season, :name => "Default")
      default_home = Factory(:page, :season => default_season, :title => "Home")
      default_child1 = Factory(:page, :season => default_season,  :parent => default_home, :title => "Child1")
      default_child2 = Factory(:page, :season => default_season, :parent => default_child1, :title => "Nested child")
    end

    it "should receive an after create callback to copy the structure" do
      new_season = Factory.build(:future_season, :name => 'New Season')
      new_season.should_receive(:copy_page_structure_from_default_season)
      new_season.save
    end

    it "should copy the first two levels of navigation from the default season after create" do
      new_season = Factory(:future_season, :name => 'New Season')
      new_season.pages.count.should == 2
      new_season.pages.map(&:level).should_not include(2)
    end
  end
  

end
