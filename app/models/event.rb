class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :event_attendees, dependent: :destroy
    has_many :attendees, through: :event_attendees, source: :attendee, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true
    validates :address, presence: true



    def user_attending?(user)
        self.attendees.include?(user)
    end


    scope :past_events, -> { where('date < ?', Time.now) }
    scope :upcoming_events, -> { where('date >= ?', Time.now) }


end
