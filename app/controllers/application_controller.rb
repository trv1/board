class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_locale

  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  private

  def set_current_user
    if session[:user_id].present?
      @current_user=User.find(session[:user_id])
      I18n.locale = @current_user.try(:locale) ? @current_user.try(:locale) : I18n.locale
    end
  end
end
