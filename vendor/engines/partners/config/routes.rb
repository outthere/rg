::Refinery::Application.routes.draw do
  resources :partners, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :partners, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
