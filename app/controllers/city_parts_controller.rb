class CityPartsController < ApplicationController
  before_action :set_city_part, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @city_parts = policy_scope(CityPart)
  end

  def show
  end

  def new
    @city_part = current_user.city_parts.build
  end

  def edit
  end

  def create
    @city_part = current_user.city_parts.build(city_part_params)
    respond_to do |format|
      if @city_part.save
        format.html { redirect_to @city_part, notice: 'City part successfully created.' }
        format.json { render :show, status: :created, location: @city_part }
      else
        format.html { render :new }
        format.json { render json: @city_part.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @city_part.update(city_part_params)
        format.html { redirect_to city_parts_url, notice: 'City part was successfully updated.' }
#        format.html { redirect_to @city_part, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_part }
      else
        format.html { render :edit }
        format.json { render json: @city_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city_part.destroy
    respond_to do |format|
      format.html { redirect_to city_parts_url, notice: 'City part was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_city_part
      @city_part = CityPart.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def city_part_params
      params.require(:city_part).permit(:name, :postal_code, :city_id, :user_id)
    end
end    