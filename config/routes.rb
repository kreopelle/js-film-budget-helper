Rails.application.routes.draw do
  resources :productions, only: [:new, :create, :edit, :update, :show]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :expenses

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  root "welcome#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
