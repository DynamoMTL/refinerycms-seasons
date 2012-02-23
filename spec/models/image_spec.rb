require 'spec_helper'

describe Image do
  
  it { should belong_to(:season) }
  
  it 'should validate that the newly created image belongs to a season' do
    season = Factory(:season)
    image = Image.create!(:id => 1,
                          :season_id => season.id,
                  :image => File.new(File.expand_path('../../uploads/dogs.jpg', __FILE__)))
    image.errors.should be_blank
  end

end
