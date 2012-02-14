require 'spec_helper'

describe Season do

  def reset_season(options = {})
    @valid_attributes = {
      :id => 1
    }

    @season.destroy! if @season
    @season = Season.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_season
  end

  context "validations" do
    
  end

end