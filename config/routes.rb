Rails.application.routes.draw do
  resources :users, only: :show do
    resources :posts, except: [:index, :show]
  end
  resources :posts, only: :show
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
