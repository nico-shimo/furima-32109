Rails.application.routes.draw do
  devise_for :users
  get "items/show/:id" => "items#show"
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:index, :create] 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
