class ApplicationController < ActionController::Base

  private

  def authenticate
    # return unless Rails.env.production?
    return if cookies[:authed]
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
      cookies[:authed] = {:value => "lol", :expires => Time.now + 720000}
    end
  end
end
