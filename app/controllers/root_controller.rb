class RootController < ApplicationController
  def index
    if I18n.locale == :ru
      @countries = Country.where(isolanguage: I18n.locale, code: %w(RU UA BY KZ GE)).sort_by{|obj| obj.name}
    else
      @countries = Country.where(isolanguage: I18n.locale).sort_by{|obj| obj.name}
    end

    @adverts = Advert.all
    @adverts = @adverts.where(country_id: params[:country_id]) if params[:country_id].present?
    @adverts = @adverts.where(location_id: params[:location_id]) if params[:location_id].present?
    @adverts = @adverts.page params[:page] || 1
  end

  def root
    # raise session[:user_id]
    # puts session[:user_id]
    # if @current_user
    #   if @current_user.locale
    #     redirect_to root_index_url, subdomain: @current_user.locale
    #   end
    # end
    # See sess_id and try request to login API and get user
  end
end
