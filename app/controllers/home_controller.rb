class HomeController < ApplicationController
  def index
    redirect_to tweet_timeline_path if session[:oauth_token]
  end
end
