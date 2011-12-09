module NavigationHelpers
  module Refinery
    module Enrollments
      def path_to(page_name)
        case page_name
        when /the list of enrollments/
          admin_enrollments_path

         when /the new enrollment form/
          new_admin_enrollment_path
        else
          nil
        end
      end
    end
  end
end
