class OutinvoiceItemsController < ApplicationController
  before_action :set_outinvoice_item, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outinvoice = Outinvoice.find(params[:outinvoice_id])
    @outinvoice.outinvoice_items.find params[:outinvoice_item_id]
  end

  def show
  end

  def new
    @outinvoice_item = current_user.outinvoice_items.build
  end

  def edit
  end

  def create
    @outinvoice_item = current_user.outinvoice_items.build(outinvoice_item_params)
    respond_to do |format|
      if @outinvoice_item.save
        format.html { redirect_to @outinvoice_item, notice: 'Outgoing invoice item successfully created.' }
        format.json { render :show, status: :created, location: @outinvoice_item }
      else
        format.html { render :new }
        format.json { render json: @outinvoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outinvoice_item.update(outinvoice_item_params)
        format.html { redirect_to outinvoice_outinvoice_items_url, notice: 'Outgoing invoice item was successfully updated.' }
        format.json { render :show, status: :ok, location: @outinvoice.outinvoice_item }
      else
        format.html { render :edit }
        format.json { render json: @outinvoice.outinvoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outinvoice.outinvoice_item.destroy
    respond_to do |format|
      format.html { redirect_to outinvoice.outinvoice_items_url, notice: 'Outgoing invoice item was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_outinvoice_item
      @outinvoice_item = OutinvoiceItem.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outinvoice_item_params
      params.require(:outinvoice_item).permit(:amount, :note, :outinvoice_id, :item_id, :user_id)
    end
end    