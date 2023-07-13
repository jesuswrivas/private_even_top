class EventAttendee < ApplicationRecord
    belongs_to :attendee, class_name: "User"
    belongs_to :event

    validates :attendee_id, uniqueness: { scope: :event_id, message: "Already as an attendee for this event" }
    
      
end
