class OutinvoicePaymentsController < ApplicationController
  before_action :set_outinvoice_payment, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outinvoice_payments = policy_scope(OutinvoicePayment)
  end

  def show
  end

  def new
    @outinvoice_payment = current_user.outinvoice_payments.build
  end

  def edit
  end

  def create
    @outinvoice_payment = current_user.outinvoice_payments.build(outinvoice_payment_params)
    respond_to do |format|
      if @outinvoice_payment.save
        format.html { redirect_to @outinvoice_payment, notice: 'Outgoing invoice payment successfully created.' }
        format.json { render :show, status: :created, location: @outinvoice_payment }
      else
        format.html { render :new }
        format.json { render json: @outinvoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outinvoice_payment.update(outinvoice_payment_params)
        format.html { redirect_to outinvoice_payments_url, notice: 'Outgoing invoice payment was successfully updated.' }
#        format.html { redirect_to @outinvoice_payment, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @outinvoice_payment }
      else
        format.html { render :edit }
        format.json { render json: @outinvoice_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outinvoice_payment.destroy
    respond_to do |format|
      format.html { redirect_to outinvoice_payments_url, notice: 'Outgoing invoice payment was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_outinvoice_payment
      @outinvoice_payment = OutinvoicePayment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outinvoice_payment_params
      params.require(:outinvoice_payment).permit(:amount, :payment_id, :outinvoice_id, :exchange_rate_id, :user_id)
    end
end   