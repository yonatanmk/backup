Rails.application.routes.draw do
  resources :horses
  resources :cars, only: :index
  resources :trains, only: :index
  resources :airplanes, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
