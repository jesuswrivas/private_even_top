class EventAttendeesController < ActionController::Base

    before_action :authenticate_user!

    def create
        @event = Event.find(params[:event_id])

        #Check if the current use is in the event
        redirect_to event_path(@event), notice: "You are already in this event" and return if @event.user_attending?(current_user)
        

        @event_attendee = @event.event_attendees.build(attendee_id: current_user.id)

        if @event_attendee.save
            flash[:notice] = "You were added to the event's attendees list"
            redirect_to @event
        else
            flash[:alert] = "We couldn't add you to the events list"
            redirect_to event_path(@event)          
        end
       
        
       
    end



end
