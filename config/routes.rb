Rails.application.routes.draw do
  
  root to: 'articles#index'
  #get 'pages/home'
  devise_for :user
  get '/tagged', to: "articles#tagged", as: :tagged
  resources :articles, param: :slug do
    resources :favorite, only: [:create, :destroy]
    resources :comments
  end
  resources :tags, only: [:index]
  resources :profiles, param: :username, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
