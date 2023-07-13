class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:show]

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


    def edit
        @event = Event.find(params[:id])

    end


    def update
        @event = Event.find(params[:id])
        
        if @event.update(event_params)
            flash[:notice] = "The event was editted successfully"
            redirect_to user_events_path(current_user)

        else
            flash.now[:alert] = "Something went wrong. We couldn't edit the event"
            render :edit

        end
        
    end



    def destroy
        @event = Event.find(params[:id])
        
        if @event.destroy
            redirect_to user_events_path(current_user.id), notice: "Event deleted succesfully"

        else
            redirect_to user_events_path(current_user.id), alert: "Couldnt delete the event"

        end
       
    end



    def show
        @event = Event.find(params[:id])
    end



    def index
        @all_events = Event.all

    end




    private


    def event_params

        params.require(:event).permit(:date, :name, :description, :address)

    end


end
