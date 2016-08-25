class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @countries = policy_scope(Country)
  end

  def show
  end

  def new
    @country = current_user.countries.build
  end

  def edit
  end

  def create
    @country = current_user.countries.build(country_params)
    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: 'Country successfully created.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to countries_url, notice: 'Country was successfully updated.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_country
      @country = Country.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def country_params
      params.require(:country).permit(:name, :user_id)
    end
end    