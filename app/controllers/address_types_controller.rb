class AddressTypesController < ApplicationController
  before_action :set_address_type, only: [:show, :edit, :update, :destroy]
#  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @address_types = current_user.address_types.all
  end

  def show
  end

  def new
    @address_type = current_user.address_types.build
  end

  def edit
  end

  def create
    @address_type = current_user.address_types.build(address_type_params)
    respond_to do |format|
      if @address_type.save
        format.html { redirect_to @address_type, notice: 'Address type successfully created.' }
        format.json { render :show, status: :created, location: @address_type }
      else
        format.html { render :new }
        format.json { render json: @address_type.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @address_type.update(address_type_params)
        format.html { redirect_to address_types_url, notice: 'Address type was successfully updated.' }
#        format.html { redirect_to @address_type, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_type }
      else
        format.html { render :edit }
        format.json { render json: @address_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address_type.destroy
    respond_to do |format|
      format.html { redirect_to address_types_url, notice: 'Address type was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_address_type
      @address_type = AddressType.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_type_params
      params.require(:address_type).permit(:name, :user_id)
    end
end    