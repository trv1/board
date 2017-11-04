class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  def classic
    @bicycle = Bicycle.new
    @advert = Advert.new(vehicle: @bicycle)
    @brands = Brand.where(is_velomobile: false)
    @other_brand = Brand.other.first
    # @popular_brands = Brand.where(is_popular: true, is_velomobile: false)
    @states = Advert::STATES
    @colors = Advert::COLORS
    if I18n.locale == :ru
      @countries = Country.where(isolanguage: I18n.locale, code: %w(RU UA BY KZ GE)).sort_by{|obj| obj.name}
    else
      @countries = Country.where(isolanguage: I18n.locale).sort_by{|obj| obj.name}
    end
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
    puts picture.errors.to_json
    render json: { id: picture.id }
  end

  def remove_picture
    picture = Photo.find_by_id(params[:id])

    if picture
      picture.image = nil
      picture.save
      picture.delete
      render json: { result: 'ok' }
    else
      render json: { result: 'fail' }
    end
  end

  def load_cities
    existed_countries = %w(RU UA BY KZ GE)
    country_code = Country.find(params[:country_id]).code
    cities = []
    regions = []
    records = []
    if existed_countries.include? country_code
      class_name = "#{country_code.downcase}Locality".classify.constantize
      # query = class_name.joins(:parent).where('ru_localities.name ilike ?', "%#{params[:q]}%")
      # cities = query.select('ru_localities.*')
      # regions = query.select('parents_ru_localities.*')
      #===========
      records = class_name.joins(:parent, "inner join locations l on #{country_code}_localities.geoname_id = l.geoname_id").where("#{country_code}_localities.name ilike ?", "%#{params[:q]}%").select("#{country_code}_localities.id, #{country_code}_localities.name as city_name, parents_#{country_code}_localities.name as region_name").order('l.population desc').limit(30)
    else
      records = Location.joins(:parent).where(country: country_code.upcase, code: 'locality').where('locations.name ilike ?', "%#{params[:q]}%").select('locations.id, locations.name as city_name, parents_locations.name as region_name').order('locations.population desc').limit(30)
    end

    data = []
    # cities.each_with_index do |city, i|
    #   data << {id: city['id'], name: (city['name'] + ', ' + regions[i]['name'])}
    # end
    records.each do |record|
      data << {id: record.id, name: (record.attributes['city_name'] + ', ' + record.attributes['region_name'])}
    end

    render json: { cities: data }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(
          :vehicle_id,
          :user_id,
          :location_id,
          :brand_id,
          :model,
          :year,
          :state,
          :color,
          :mileage,
          :country_id,
          :place,
          :name,
          :phone,
          :email,
          :is_exchange,
          :time,
          :description,
          :price,
          :is_domestic_delivery,
          :is_delivery_abroad,
          :is_around_the_clock
      )
    end
end
