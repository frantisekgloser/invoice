class IncommingInvoicePaymentsController < ApplicationController
  before_action :set_incomming_invoice_payment, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @incomming_invoice_payments = policy_scope(IncommingInvoicePayment)
  end

  def show
  end

  def new
    @incomming_invoice_payment = current_user.incomming_invoice_payments.build
  end

  def edit
  end

  def create
    @incomming_invoice_payment = current_user.incomming_invoice_payments.build(incomming_invoice_payment_params)
    respond_to do |format|
      if @incomming_invoice_payment.save
        format.html { redirect_to incomming_invoice_payments_url, notice: 'Incomming invoice payment successfully created.' }
        format.json { render :show, status: :created, location: @incomming_invoice_payment }
      else
        format.html { render :new }
        format.json { render json: @incomming_invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @incomming_invoice_payment.update(incomming_invoice_payment_params)
        format.html { redirect_to incomming_invoice_payments_url, notice: 'Incomming invoice payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @incomming_invoice_payment }
      else
        format.html { render :edit }
        format.json { render json: @incomming_invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incomming_invoice_payment.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to incomming_invoice_payments_url, notice: 'Incomming invoice payment was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Incomming invoice payment was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_incomming_invoice_payment
      @incomming_invoice_payment = IncommingInvoicePayment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def incomming_invoice_payment_params
      params.require(:incomming_invoice_payment).permit(:amount, :payment_id, :incomming_invoice_id, :exchange_rate_id, :user_id)
    end
end    