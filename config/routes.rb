Rails.application.routes.draw do

    devise_for :users
    root to: "events#index"

    resources :events, only: [:show] do
      resources :event_attendees, only: [:create, :delete]
    end
    

    resources :users, only: [:show] do
        resources :events, except: [:show]
    end


    

end
