class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    flash.clear
    flash[:success] = 'Добро пожаловать! Вы успешно вошли на сайт.'
  end

  def destroy
    super
    flash.clear
    flash[:success] = 'Выход выполнен.'
  end
end
