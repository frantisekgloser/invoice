class OutgoingInvoicesController < ApplicationController
  before_action :set_outgoing_invoice, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    params[:from] == nil ? nil : $from=params[:from]
    params[:till] == nil ? nil : $till=params[:till]
    @outgoing_invoices = policy_scope(OutgoingInvoice).where(generated_on_date: $from.to_date..$till.to_date)
  end

  def show
  end

  def new
    @outgoing_invoice = current_user.outgoing_invoices.build
  end

  def edit
  end

  def create
    @outgoing_invoice = current_user.outgoing_invoices.build(outgoing_invoice_params)
    respond_to do |format|
      if @outgoing_invoice.save
        format.html { redirect_to outgoing_invoices_url, notice: 'Outgoing invoice was successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_invoice }
      else
        format.html { render :new }
        format.json { render json: @outgoing_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outgoing_invoice.update(outgoing_invoice_params)
        format.html { redirect_to outgoing_invoices_url, notice: 'Outgoing invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_invoice }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outgoing_invoice.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to outgoing_invoices_url, notice: 'Outgoing invoice was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Outgoing invoice was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_outgoing_invoice
      @outgoing_invoice = OutgoingInvoice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_invoice_params
      params.require(:outgoing_invoice).permit(:number, :generated_on_date, :taxable_supply_date, :due_date, :total_computed_base, :total_computed_vat, :total_corrected_base, :total_corrected_vat, :reverse_charge, :paid, :note, :original_invoice, :original_invoice_md5, :translated_invoice, :translated_invoice_md5, :outgoing_invoice_sequence_id, :trade_subject_id, :currency_id, :exchange_rate_id, :user_id)
    end
end    