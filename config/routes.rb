Rails.application.routes.draw do
  root "welcome#home"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/auth/google_oauth2/callback" => 'sessions#create'

  resources :users, only: [:new, :create, :show] do
    resources :expenses
  end

  resources :productions, only: [:show, :new, :create, :edit, :update] do
    resources :expenses, only: [:show, :new, :create]
  end

  resources :expenses, only: [:update, :destroy]

  get 'pending_expenses', to: 'expenses#pending'
  get 'approved_expenses', to: 'expenses#approved'
  get 'not_approved_expenses', to: 'expenses#not_approved'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
