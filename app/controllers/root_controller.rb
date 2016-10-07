class RootController < ApplicationController
  def index

  end

  def root
    # raise session[:user_id]
    puts session[:user_id]
    if @current_user
      if @current_user.locale
        redirect_to root_index_url, subdomain: @current_user.locale
      end
    end
  end
end
