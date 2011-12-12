module NavigationHelpers
  module Refinery
    module Partners
      def path_to(page_name)
        case page_name
        when /the list of partners/
          admin_partners_path

         when /the new partner form/
          new_admin_partner_path
        else
          nil
        end
      end
    end
  end
end
