class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_locale

  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  def set_current_user
    if session[:user_id].present?
      @current_user=User.find(session[:user_id])
    end
  end
end
