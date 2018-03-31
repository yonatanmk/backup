Rails.application.routes.draw do
  root 'galleries#index'
  resources :galleries, only: [:index, :show, :new, :create] do
    resources :paintings, only: [:new, :create]
  end
end
