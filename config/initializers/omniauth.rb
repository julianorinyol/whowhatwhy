Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret, { access_type: 'offline', scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/calendar.readonly' }
end


# scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar'