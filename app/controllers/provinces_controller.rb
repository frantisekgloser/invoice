class ProvincesController < ApplicationController
  before_action :set_province, only: [:show, :edit, :update, :destroy]
 # after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @provinces = current_user.provinces.all
  end

  def show
  end

  def new
    @province = current_user.provinces.build
  end

  def edit
  end

  def create
    @province = current_user.provinces.build(province_params)
    respond_to do |format|
      if @province.save
        format.html { redirect_to @province, notice: 'Province was successfully created.' }
        format.json { render :show, status: :created, location: @province }
      else
        format.html { render :new }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to provinces_url, notice: 'Province was successfully updated.' }
#        format.html { redirect_to @province, notice: 'Province was successfully updated.' }
        format.json { render :show, status: :ok, location: @province }
      else
        format.html { render :edit }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @province.destroy
    respond_to do |format|
      format.html { redirect_to provinces_url, notice: 'Province was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_province
      @province = Province.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def province_params
      params.require(:province).permit(:name, :country_id, :user_id)
    end
end    