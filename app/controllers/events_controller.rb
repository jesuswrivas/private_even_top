class EventsController < ApplicationController

    def new
        @user = current_user
        @new_event = current_user.events_created.build

    end


    def create
        @user = current_user
        @new_event = current_user.events_created.build(event_params)

        if @new_event.save
            flash[:notice] = "The event was created successfully"
            redirect_to :root

        else
            flash.now[:alert] = "Something went wrong. We couldn't create the event"
            render :new

        end


    end



    def index
        @all_events = Event.all

    end




    private


    def event_params

        params.require(:event).permit(:date)

    end


end
