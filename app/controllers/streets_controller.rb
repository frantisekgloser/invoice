class StreetsController < ApplicationController
  before_action :set_street, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @streets = policy_scope(Street)
  end

  def show
  end

  def new
    @street = current_user.streets.build
  end

  def edit
  end

  def create
    @street = current_user.streets.build(street_params)
    respond_to do |format|
      if @street.save
        format.html { redirect_to @street, notice: 'Street was successfully created.' }
        format.json { render :show, status: :created, location: @street }
      else
        format.html { render :new }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @street.update(street_params)
        format.html { redirect_to streets_url, notice: 'Street was successfully updated.' }
#        format.html { redirect_to @street, notice: 'Street was successfully updated.' }
        format.json { render :show, status: :ok, location: @street }
      else
        format.html { render :edit }
        format.json { render json: @street.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @street.destroy
    respond_to do |format|
      format.html { redirect_to streets_url, notice: 'Street was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_street
      @street = Street.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def street_params
      params.require(:street).permit(:name, :city_id, :city_part_id, :user_id)
    end
end    