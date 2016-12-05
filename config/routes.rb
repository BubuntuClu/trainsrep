Rails.application.routes.draw do
  resources :routes
  
  resources :trains do
    resources :cars, shallow: true
  end
  
  resources :railway_stations do
    patch :update_station_order, on: :member
  end

  resource :search, only: [:new, :show, :edit]

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
