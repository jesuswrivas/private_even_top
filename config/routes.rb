Rails.application.routes.draw do
  get 'users/show'
    devise_for :users
    root to: "events#index"

    resources :events, only: [:show, :index]

    resources :users, only: [:show] do
        resources :events, except: [:show, :index]
    end
      

end
