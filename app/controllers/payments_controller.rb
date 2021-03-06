class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @payments = policy_scope(Payment)
  end

  def show
  end

  def new
    @payment = current_user.payments.build
  end

  def edit
  end

  def create
    @payment = current_user.payments.build(payment_params)
    respond_to do |format|
      if @payment.save
        format.html { redirect_to payments_url, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payments_url, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Payment was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_payment
      @payment = Payment.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:date, :amount, :note, :payment_type_id, :currency_id, :bank_account_id, :trade_subject_id, :vat_report_id, :income_report_id, :user_id)
    end
end    