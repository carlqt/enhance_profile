Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, PRIV[:fb_id], PRIV[:fb_secret]
end