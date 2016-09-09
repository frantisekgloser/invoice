class HouseNumbersController < ApplicationController
  before_action :set_house_number, only: [:show, :edit, :update, :destroy, :address_complete]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @house_numbers = policy_scope(HouseNumber)
  end

  def show
  end

  def new
    @house_number = current_user.house_numbers.build
  end

  def edit
  end

  def create
    @house_number = current_user.house_numbers.build(house_number_params)
    respond_to do |format|
      if @house_number.save
        format.html { redirect_to house_numbers_url, notice: 'Address link successfully created.' }
        format.json { render :show, status: :created, location: @house_number }
      else
        format.html { render :new }
        format.json { render json: @house_number.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @house_number.update(house_number_params)
        format.html { redirect_to house_numbers_url, notice: 'Address link was successfully updated.' }
        format.json { render :show, status: :ok, location: @house_number }
      else
        format.html { render :edit }
        format.json { render json: @house_number.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house_number.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to house_numbers_url, notice: 'House number was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'House number was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_house_number
      @house_number = HouseNumber.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def house_number_params
      params.require(:house_number).permit(:house_number, :city_id, :street_id, :user_id)
    end
end    