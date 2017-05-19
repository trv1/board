class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  def classic
    @bicycle = Bicycle.new
    @advert = Advert.new(vehicle: @bicycle)
    @brands = Brand.where(is_velomobile: false)
    @popular_brands = Brand.where(is_popular: true, is_velomobile: false)
    @states = Advert::STATES
    @colors = Advert::COLORS
    @countries = Country.where(isolanguage: I18n.locale).sort_by{|obj| obj.name}
  end

  def velomobile
    @velomobile = Velomobile.new
    @advert = Advert.new(vehicle: @velomobile)
  end

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.all
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: 'Advert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_picture
    picture = Photo.create(image: params[:file])
    render json: { id: picture.id }
  end

  def remove_picture
    begin
      picture = Photo.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      picture = nil
    end

    if picture
      picture.delete
      render json: { result: 'ok' }
    else
      render json: { result: 'fail' }
    end
  end

  def load_cities
    country = params[:country]
    @multi_lang_cities = City.where(country: country.upcase)
    if I18n.locale == 'ru'

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:vehicle_id, :user_id, :location_id, :brand_id, :model, :year, :state, :color, :mileage, :country_id, :place, :name, :phone, :email, :is_exchange, :time, :description, :price)
    end
end
