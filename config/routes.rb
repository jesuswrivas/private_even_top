Rails.application.routes.draw do
    devise_for :users
    root to: "events#index"

    resources :events, only: [:show, :index]

    resources :users do
        resources :events, except: [:show, :index]
    end
      

end
