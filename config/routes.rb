Rails.application.routes.draw do
  root "welcome#home"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/auth/google_oauth2/callback" => 'sessions#create'

  resources :users, only: [:new, :create, :show] do
    resources :expenses, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  
  resources :productions, only: [:new, :create, :edit, :update, :show, :index] do
    resources :expenses, only: [:show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
