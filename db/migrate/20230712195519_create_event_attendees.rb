class CreateEventAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendees do |t|
      t.references :attendee, index: true, foreign_key: {to_table: :users}
      t.references :event, index: true, foreign_key: true, null: false
    end
  end
end
