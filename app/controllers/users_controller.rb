class UsersController < ApplicationController
  def show
    @user_events_created = current_user.events_created
    
  end
end
