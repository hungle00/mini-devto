Rails.application.routes.draw do
  
  get 'stats' => 'stats#index'
  root to: 'home#index'

  devise_for :user
  get '/tagged', to: "home#tagged", as: :tagged
  get 'feed' => 'home#feed'

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
