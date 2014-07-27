class LinkedInController < ApplicationController
  def index
    if params[:code]
      @code = params[:code]
      http = HTTParty.post("https://www.linkedin.com/uas/oauth2/accessToken?grant_type=authorization_code&code=#{@code}&redirect_uri=http://localhost:3000&client_id=#{PRIV[:li_key]}&client_secret=#{PRIV[:li_secret]}")
      access_token = http["access_token"]
      @xml_profile = HTTParty.get("https://api.linkedin.com/v1/people/~:(summary,first-name,skills,phone-numbers,positions,picture-url)?oauth2_access_token=#{access_token}")
      Profile.find_by_smedia('linked_in').update_attribute(:object, @xml_profile.to_json)
    end

    @li_profile = Profile.find_by_smedia 'linked_in'
    @li_profile = JSON.parse(@li_profile.object)

    @fb_profile = Profile.find_by_smedia 'facebook'
    @fb_profile = Koala::Facebook::API.new(@fb_profile.object)

    unless @li_profile["error"]
      @positions = @li_profile["person"]["positions"]["position"]
      @skills = @li_profile["person"]["skills"]["skill"]
    end
  end

  def li_log


    redirect_to root_path
  end

  def facebook
    if env["omniauth.auth"]
      @profile = env["omniauth.auth"]
      # @facebook = Koala::Facebook::API.new(@profile.credentials.token)
      # @photos = @facebook.get_connections("me", "photos")
      Profile.find_by_smedia('facebook').update_attribute(:object, @profile.credentials.token)
    end

    redirect_to root_path
  end

  def fb_log
    

  end

  def access_token
  end
end