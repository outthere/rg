::Refinery::Application.routes.draw do
  resources :menu_blocks, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :menu_blocks, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
