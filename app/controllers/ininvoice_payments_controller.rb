class IninvoicePaymentsController < ApplicationController
  before_action :set_ininvoice_payment, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @ininvoice_payments = policy_scope(IninvoicePayment)
  end

  def show
  end

  def new
    @ininvoice_payment = current_user.ininvoice_payments.build
  end

  def edit
  end

  def create
    @ininvoice_payment = current_user.ininvoice_payments.build(ininvoice_payment_params)
    respond_to do |format|
      if @ininvoice_payment.save
        format.html { redirect_to @ininvoice_payment, notice: 'Incomming invoice payment successfully created.' }
        format.json { render :show, status: :created, location: @ininvoice_payment }
      else
        format.html { render :new }
        format.json { render json: @ininvoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @ininvoice_payment.update(ininvoice_payment_params)
        format.html { redirect_to ininvoice_payments_url, notice: 'Incomming invoice payment was successfully updated.' }
#        format.html { redirect_to @ininvoice_payment, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @ininvoice_payment }
      else
        format.html { render :edit }
        format.json { render json: @ininvoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ininvoice_payment.destroy
    respond_to do |format|
      format.html { redirect_to ininvoice_payments_url, notice: 'Incomming invoice payment was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_ininvoice_payment
      @ininvoice_payment = IninvoicePayment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ininvoice_payment_params
      params.require(:ininvoice_payment).permit(:amount, :payment_id, :ininvoice_id, :exchange_rate_id, :user_id)
    end
end    