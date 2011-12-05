module NavigationHelpers
  module Refinery
    module MenuBlocks
      def path_to(page_name)
        case page_name
        when /the list of menu_blocks/
          admin_menu_blocks_path

         when /the new menu_block form/
          new_admin_menu_block_path
        else
          nil
        end
      end
    end
  end
end
