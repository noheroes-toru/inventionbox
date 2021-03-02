Rails.application.routes.draw do
  devise_for :users, controllers:{ registrations:"registrations" }
  root to: "posts#index"
  resources :posts, only:[:index, :new, :create, :destroy] do
    resources :likes, only: [:create]
    collection do
      get 'search'
      get 'ranking'
    end
  end
end
