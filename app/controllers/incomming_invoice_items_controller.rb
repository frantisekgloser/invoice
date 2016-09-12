class IncommingInvoiceItemsController < ApplicationController
  before_action :set_incomming_invoice_item, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @incomming_invoice = IncommingInvoice.find(params[:incomming_invoice_id])
    @incomming_invoice.incomming_invoice_items = policy_scope(IncommingInvoiceItem)
  end

  def show
  end

  def new
    @incomming_invoice = IncommingInvoice.find(params[:incomming_invoice_id])
    @incomming_invoice_item = @incomming_invoice.incomming_invoice_items.build
  end

  def edit
  end

  def create
    @incomming_invoice = IncommingInvoice.find(params[:incomming_invoice_id])
    @incomming_invoice_item = @incomming_invoice.incomming_invoice_items.build(incomming_invoice_item_params)
    respond_to do |format|
      if @incomming_invoice_item.save
        format.html { redirect_to edit_incomming_invoice_path(@incomming_invoice), notice: 'Incomming invoice item successfully created.' }
        format.json { render :show, status: :created, location: @incomming_invoice.incomming_invoice_item }
      else
        format.html { render :new }
        format.json { render json: @incomming_invoice.incomming_invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @incomming_invoice_item.update(incomming_invoice_item_params)
        format.html { redirect_to edit_incomming_invoice_path(@incomming_invoice_item.incomming_invoice_id), notice: 'Incomming invoice item was successfully updated.' }
        format.json { render :show, status: :ok, location: @incomming_invoice.incomming_invoice_item }
      else
        format.html { render :edit }
        format.json { render json: @incomming_invoice.incomming_invoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incomming_invoice_item.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to edit_incomming_invoice_url, notice: 'Incomming invoice was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Incomming invoice was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_incomming_invoice_item
      @incomming_invoice_item = IncommingInvoiceItem.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def incomming_invoice_item_params
      params.require(:incomming_invoice_item).permit(:amount, :note, :incomming_invoice_id, :item_id, :user_id)
    end
end    