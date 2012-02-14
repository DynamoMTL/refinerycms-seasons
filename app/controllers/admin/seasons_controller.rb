module Admin
  class SeasonsController < Admin::BaseController

    crudify :season, :xhr_paging => true

  end
end
