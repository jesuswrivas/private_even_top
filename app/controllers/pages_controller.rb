class PagesController < ApplicationController
    
    def main
        @last_10_events = Event.order(created_at: :desc).limit(10)

    end


end
