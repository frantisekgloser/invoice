class OutgoingInvoicePaymentsController < ApplicationController
  before_action :set_outgoing_invoice_payment, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outgoing_invoice_payments = policy_scope(OutgoingInvoicePayment)
  end

  def show
  end

  def new
    @outgoing_invoice_payment = current_user.outgoing_invoice_payments.build
  end

  def edit
  end

  def create
    @outgoing_invoice_payment = current_user.outgoing_invoice_payments.build(outgoing_invoice_payment_params)
    respond_to do |format|
      if @outgoing_invoice_payment.save
        format.html { redirect_to outgoing_invoice_payments_url, notice: 'Outgoing invoice payment successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_invoice_payment }
      else
        format.html { render :new }
        format.json { render json: @outgoing_invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outgoing_invoice_payment.update(outgoing_invoice_payment_params)
        format.html { redirect_to outgoing_invoice_payments_url, notice: 'Outgoing invoice payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_invoice_payment }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_invoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outgoing_invoice_payment.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to outgoing_invoice_payments_url, notice: 'Outgoing invoice payment was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Outgoing invoice payment was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_outgoing_invoice_payment
      @outgoing_invoice_payment = OutgoingInvoicePayment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_invoice_payment_params
      params.require(:outgoing_invoice_payment).permit(:amount, :payment_id, :outgoing_invoice_id, :exchange_rate_id, :user_id)
    end
end   