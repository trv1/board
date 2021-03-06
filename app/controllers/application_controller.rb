class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception


  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
    Rails.application.routes.default_url_options[:host] = "#{I18n.locale}.board.dev"
    Rails.application.routes.default_url_options[:port] = '3000'
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end
end
