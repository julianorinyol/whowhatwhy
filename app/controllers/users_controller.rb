class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
      @calendars = current_user.calendars 
      
      @events = current_user.events.where.not('start': nil)

      @hangouts = current_user.hangouts
    end
  end
end
