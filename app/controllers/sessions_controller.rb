class SessionsController < ApplicationController

  def new
    redirect_to '/auth/google_oauth2'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

    user.google_auth_token = auth.credentials.token
    user.save
    reset_session
    session[:user_id] = user.id
    # sleep 1

    # do a get request to google apis (with the Authorization header set properly) to list calendar  --> get the primary calendar's id
    user.get_calendars

    # do a get request to google apis (with Authorization header) to list events on the primary calendary

    # save all the events in the data base

    redirect_to root_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
