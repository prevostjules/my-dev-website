require 'net/https'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  RECAPTCHA_MINIMUM_SCORE = 0.5

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def verify_recaptcha?(token, recaptcha_action)
    secret_key = ENV["RECAPTCHA_SECRET_KEY"]
    p secret_key
    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    json['success'] && json['score'] > RECAPTCHA_MINIMUM_SCORE && json['action'] == recaptcha_action
  end

end
