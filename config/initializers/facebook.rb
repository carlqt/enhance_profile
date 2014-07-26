Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, PRIV[:fb_id], PRIV[:fb_secret], scope: "user_likes,user_interests,user_photos,user_relationships,user_birthday,user_activities,user_about_me"
end