class AddAttributeEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :address, :text
  end
end
