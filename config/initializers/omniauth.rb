Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['WEDDING_FACEBOOK_KEY'], ENV['WEDDING_FACEBOOK_SECRET']
end
