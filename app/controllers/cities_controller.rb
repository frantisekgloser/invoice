class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @cities = policy_scope(City)
  end

  def show
  end

  def new
    @city = current_user.cities.build
  end

  def edit
  end

  def create
    @city = current_user.cities.build(city_params)
    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_url, notice: 'City successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to cities_url, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_city
      @city = City.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :postal_code, :country_id, :province_id, :user_id)
    end
end    