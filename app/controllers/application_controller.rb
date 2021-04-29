class ApplicationController < ActionController::Base
  before_action :set_theme

  private

  def authenticate
    # return unless Rails.env.production?
    return if cookies[:authed] || Rails.env.development?
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
      cookies[:authed] = {:value => "lol", :expires => Time.now + 720000}
    end
  end

  def set_theme
    if params[:theme].present?
      theme = params[:theme].to_sym
      # session[:theme] = theme
      cookies[:theme] = theme
      redirect_to(request.referrer || root_path)
    end
  end
end
