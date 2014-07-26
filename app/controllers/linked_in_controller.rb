class LinkedInController < ApplicationController
  def index
    @code = params[:code]
    http = HTTParty.post("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{@code}&redirect_uri=http://localhost:3000&client_id=#{PRIV[:li_key]}&client_secret=#{PRIV[:li_secret]}")
    access_token = http["access_token"]
    xml_profile = HTTParty.get("https://api.linkedin.com/v1/people/~:(first-name,skills)?oauth2_access_token=#{access_token}")
  end

  def access_token
  end
end
