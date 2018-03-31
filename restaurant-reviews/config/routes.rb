Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  resources :categories, only: [:index, :show]
end
