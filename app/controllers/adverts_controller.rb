class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]

  def classic
    @advert = Advert.new
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
    @advert = Advert.new
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
    bicycle_custom_params = params.reject{|e| /\Aadvert|\Apictures/===e}
    advert_custom_params = params.reject{|e| /\Abicycle|\Apictures/===e}
    @advert = Advert.new(advert_params(advert_custom_params))
    @bicycle = Bicycle.new(bicycle_params(bicycle_custom_params))
    @advert.vehicle = @bicycle
    @bicycle.save
    @advert.save

    # respond_to do |format|
      if @bicycle.errors.blank? && @advert.errors.blank?
        ActiveRecord::Base.establish_connection.connection.execute("update photos set advert_id=#{@advert.id} where id IN (#{params[:pictures]});") if params[:pictures].present?
        # format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        # format.json { render :show, status: :created, location: @advert }
        render json: {status: 'ok'}
      else
        # format.html { render :new }
        # format.json { render json: @advert.errors, status: :unprocessable_entity }
        # puts @bicycle.errors.to_json
        render json: {status: :unprocessable_entity}.merge({messages: @advert.errors.messages.map{|k,v| [k,v]}.to_a})
      end
    # end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      # if @advert.update(advert_params)
      #   format.html { redirect_to @advert, notice: 'Advert was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @advert }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @advert.errors, status: :unprocessable_entity }
      # end
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
    if existed_countries.include? country_code
      class_name = "#{country_code.downcase}Locality".classify.constantize
      records = class_name.joins(:parent, "inner join locations l on #{country_code}_localities.geoname_id = l.geoname_id").where("#{country_code}_localities.name ilike ?", "%#{params[:q]}%").select("#{country_code}_localities.id, #{country_code}_localities.name as city_name, parents_#{country_code}_localities.name as region_name").order('l.population desc').limit(30)
    else
      records = Location.joins(:parent).where(country: country_code.upcase, code: 'locality').where('locations.name ilike ?', "%#{params[:q]}%").select('locations.id, locations.name as city_name, parents_locations.name as region_name').order('locations.population desc').limit(30)
    end

    data = []
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
    def advert_params(custom_params)
      custom_params.require(:advert).permit(
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
        # :time,
        # :description,
        :currency_id,
        :price,
        :is_domestic_delivery,
        :is_delivery_abroad,
        :is_around_the_clock
      )
    end

    def bicycle_params(custom_params)
      custom_params.require(:bicycle).permit(
        :c76, :c98, :c87, :c77, :c78, :c84, :c89, :c90, :c91, :c92, :c93, :c94, :c95, :c96, :c97, :c99, :c37, :c1, :c2,
        :c17, :c39, :c57, :c59, :c10, :c79, :c11, :c100, :c12
      )
    end
end
