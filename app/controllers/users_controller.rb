class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
      @calendars = Calendar.where(user_id: current_user.id)
      @events = Event.where(user_id: current_user.id)
    end
  end
end
