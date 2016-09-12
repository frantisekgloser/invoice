class OutgoingInvoiceItemsController < ApplicationController
  before_action :set_outgoing_invoice_item, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outgoing_invoice = OutgoingInvoice.find(params[:outgoing_invoice_id])
    @outgoing_invoice.outgoing_invoice_items = policy_scope(OutgoingInvoiceItem)
  end

  def show
  end

  def new
    @outgoing_invoice = OutgoingInvoice.find(params[:outgoing_invoice_id])
    @outgoing_invoice_item = @outgoing_invoice.outgoing_invoice_items.build
  end

  def edit
    @outgoing_invoice = OutgoingInvoice.find(params[:outgoing_invoice_id])
  end

  def create
    @outgoing_invoice = OutgoingInvoice.find(params[:outgoing_invoice_id])
    @outgoing_invoice_item = @outgoing_invoice.outgoing_invoice_items.build(outgoing_invoice_item_params)
    respond_to do |format|
      if @outgoing_invoice_item.save
        format.html { redirect_to edit_outgoing_invoice_path(@outgoing_invoice), notice: 'Incomming invoice item successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_invoice.outgoing_invoice_item }
      else
        format.html { render :new }
        format.json { render json: @outgoing_invoice.outgoing_invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outgoing_invoice_item.update(outgoing_invoice_item_params)
        format.html { redirect_to edit_outgoing_invoice_path(@outgoing_invoice_item.outgoing_invoice_id), notice: 'Incomming invoice item was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_invoice.outgoing_invoice_item }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_invoice.outgoing_invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outgoing_invoice_item.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to edit_outgoing_invoice_url, notice: 'Outgoing invoice item was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Outgoing invoice item was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_outgoing_invoice_item
      @outgoing_invoice_item = OutgoingInvoiceItem.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_invoice_item_params
      params.require(:outgoing_invoice_item).permit(:amount, :note, :outgoing_invoice_id, :item_id, :user_id)
    end
end    