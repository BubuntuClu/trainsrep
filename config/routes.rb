Rails.application.routes.draw do
  resources :routes
  
  resources :trains do
    resources :cars, shallow: true
  end
  
  resources :railway_stations do
    patch :update_station_order, on: :member
    patch :update_time, on: :member
  end

  resource :search, only: [:show, :create]
  # resource :ticket, only: [:show, :create, :new]
  resources :tickets

  get 'welcome/index'
  root 'welcome#index'
end
