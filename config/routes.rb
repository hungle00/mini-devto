Rails.application.routes.draw do
  
  root to: 'articles#index'
  #get 'pages/home'
  devise_for :user
  get '/tagged', to: "articles#tagged", as: :tagged
  resources :articles, param: :slug do
    resource :favorite, only: %i[create destroy]
    resources :comments
  end
  resources :tags, only: [:index]
  resources :profiles, param: :username, only: [:show] do
    resource :follow, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
