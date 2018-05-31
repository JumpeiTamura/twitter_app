# coding: utf-8
class TweetController < ApplicationController
  #helper_method :timeline
  before_action :set_twitter_client

  require 'twitter'

  def timeline
    redirect_to root_url unless session[:oauth_token]
    @tweets = @client.home_timeline(:count => 200)
    @followers = @client.followers
  end

  def update
    @client.update(params[:text])
    flash[:success] = '投稿しました！'
    redirect_to action: :timeline
  end

  def dm
    @client.create_direct_message(params[:scrname], params[:text])
    flash[:success] = 'DMを送りました！'
    redirect_to action: :timeline
  end

  private

  def set_twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      config.access_token        = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end
  end
end
