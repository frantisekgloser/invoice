class IncommingInvoicesController < ApplicationController
  before_action :set_incomming_invoice, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    params[:from] == nil ? $from='1900-01-01' : $from=params[:from]
    params[:till] == nil ? $till='2100-12-31' : $till=params[:till]
    @incomming_invoices = policy_scope(IncommingInvoice).where(generated_on_date: $from.to_date..$till.to_date)
  end

  def show
  end

  def new
    @incomming_invoice = current_user.incomming_invoices.build
  end

  def edit
  end

  def create
    @incomming_invoice = current_user.incomming_invoices.build(incomming_invoice_params)
    respond_to do |format|
      if @incomming_invoice.save
        format.html { redirect_to incomming_invoices_url, notice: 'Incomming invoice was successfully created.' }
        format.json { render :show, status: :created, location: @incomming_invoice }
      else
        format.html { render :new }
        format.json { render json: @incomming_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @incomming_invoice.update(incomming_invoice_params)
        format.html { redirect_to incomming_invoices_url, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @incomming_invoice }
      else
        format.html { render :edit }
        format.json { render json: @incomming_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incomming_invoice.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to incomming_invoices_url, notice: 'Incomming invoice was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Incomming invoice was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_incomming_invoice
      @incomming_invoice = IncommingInvoice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def incomming_invoice_params
      params.require(:incomming_invoice).permit(:number, :generated_on_date, :taxable_supply_date, :due_date, :total_computed_base, :total_computed_vat, :total_corrected_base, :total_corrected_vat, :reverse_charge, :paid, :note, :original_invoice, :original_invoice_md5, :translated_invoice, :translated_invoice_md5, :incomming_invoice_sequence_id, :trade_subject_id, :currency_id, :exchange_rate_id, :user_id)
    end
end    