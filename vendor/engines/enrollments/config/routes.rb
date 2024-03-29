::Refinery::Application.routes.draw do
  resources :enrollments, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :enrollments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
