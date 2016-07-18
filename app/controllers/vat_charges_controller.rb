class VatChargesController < ApplicationController
  before_action :set_vat_charge, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @vat_charges = policy_scope(VatCharge)
  end

  def show
  end

  def new
    @vat_charge = current_user.vat_charges.build
  end

  def edit
  end

  def create
    @vat_charge = current_user.vat_charges.build(vat_charge_params)
    respond_to do |format|
      if @vat_charge.save
        format.html { redirect_to @vat_charge, notice: 'Vat charge successfully created.' }
        format.json { render :show, status: :created, location: @vat_charge }
      else
        format.html { render :new }
        format.json { render json: @vat_charge.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @vat_charge.update(vat_charge_params)
        format.html { redirect_to vat_charges_url, notice: 'Vat charge was successfully updated.' }
#        format.html { redirect_to @vat_charge, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @vat_charge }
      else
        format.html { render :edit }
        format.json { render json: @vat_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vat_charge.destroy
    respond_to do |format|
      format.html { redirect_to vat_charges_url, notice: 'Vat charge was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_vat_charge
      @vat_charge = VatCharge.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def vat_charge_params
      params.require(:vat_charge).permit(:percentage, :coutry_id, :user_id)
    end
end    