class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.password.blank? && @user.password_confirmation.blank?
      password = Devise.friendly_token(10)
      @user.password = password
      @user.password_confirmation = password
    else
      password = @user.password
    end

    # session_id = session.respond_to?(:id) ? session.id : session[:session_id]
    # rucaptcha_sesion_key_key = ['rucaptcha-session', session_id].join(':')
    # puts rucaptcha_sesion_key_key.to_json
    # puts RuCaptcha.cache.read(rucaptcha_sesion_key_key, keep_session: true).to_json
    is_verify_captcha = verify_rucaptcha?(@user, keep_session: true)

    if is_verify_captcha
      @password = password
      @user.locale = I18n.locale.to_s
      @user.save
      if @user.errors.blank?
        flash[:success] = t 'actions.user.create'
        UserMailer.welcome_email(@user,password).deliver_now
        redirect_to root_path
      else
        messages = {messages: @user.errors.messages.map{|k,v| [k,v]}.to_a}
        render json: {status: :unprocessable_entity}.merge(messages)
      end
    else
      messages = {messages: @user.errors.messages.map{|k,v| [k,v]}.to_a}
      messages[:messages].push ['captcha',['Неверный код с картинки']] unless is_verify_captcha
      render json: {status: :unprocessable_entity}.merge(messages)
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation, :locale)
    end
end
