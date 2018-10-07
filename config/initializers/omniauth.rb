Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
  else
    provider :twitter, Rails.application.credentials.TWITTER_API_KEY, Rails.application.credentials.TWITTER_API_SECRET
  end

end