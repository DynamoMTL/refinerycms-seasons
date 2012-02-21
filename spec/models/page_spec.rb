require 'spec_helper'

describe Page do

  it { should belong_to(:season) }
  it { should validate_presence_of(:season_id) }
end
