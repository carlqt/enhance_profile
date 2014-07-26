class LinkedInController < ApplicationController
  def index
    @code = params[:code]
    http = HTTParty.post("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{@code}&redirect_uri=http://localhost:3000&client_id=#{PRIV[:li_key]}&client_secret=#{PRIV[:li_secret]}")
    access_token = http["access_token"]
    xml_profile = HTTParty.get("https://api.linkedin.com/v1/people/~:(first-name,skills,positions)?oauth2_access_token=#{access_token}")
    session[:li] = xml_profile
    binding.pry
  end

  def facebook
    if env["omniauth.auth"]
      @profile = env["omniauth.auth"]
      @facebook = Koala::Facebook::API.new(@profile.credentials.token)
      @photos = @facebook.get_connections("me", "photos")
    end
  end

  def fb_log

  end

  def access_token
  end
end