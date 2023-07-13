Rails.application.routes.draw do

    devise_for :users
    root to: "pages#main"

    resources :events, only: [:show] do
      resources :event_attendees, only: [:create, :delete]
    end
    

    resources :users, only: [:show] do
        resources :events, except: [:show]
    end


    

end
