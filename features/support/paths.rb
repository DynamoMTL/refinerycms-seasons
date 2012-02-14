module NavigationHelpers
  module Refinery
    module Seasons
      def path_to(page_name)
        case page_name
        when /the list of seasons/
          admin_seasons_path

         when /the new season form/
          new_admin_season_path
        else
          nil
        end
      end
    end
  end
end
