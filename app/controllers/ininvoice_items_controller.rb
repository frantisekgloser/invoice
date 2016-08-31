class IninvoiceItemsController < ApplicationController
  before_action :set_ininvoice_item, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @ininvoice = Ininvoice.find(params[:ininvoice_id])
    @ininvoice.ininvoice_items.find params[:ininvoice_item_id]
#   @ininvoice_items = policy_scope(IninvoiceItem)
  end

  def show
  end

  def new
    @ininvoice = Ininvoice.find(params[:ininvoice_id])
    @ininvoice_item = @ininvoice.ininvoice_items.build
  end

  def edit
  end

  def create
    @ininvoice = Ininvoice.find(params[:ininvoice_id])
    @ininvoice_item = @ininvoice.ininvoice_items.build(ininvoice_item_params)
    respond_to do |format|
      if @ininvoice_item.save
        format.html { redirect_to "http://localhost:3000/ininvoices/#{@ininvoice.id}/edit?", notice: 'Incomming invoice item successfully created.' }
        format.json { render :show, status: :created, location: @ininvoice.ininvoice_item }
      else
        format.html { render :new }
        format.json { render json: @ininvoice.ininvoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    @ininvoice = Ininvoice.find(params[:ininvoice_id])
    respond_to do |format|
      if @ininvoice.ininvoice_item.update(ininvoice_item_params)
        format.html { redirect_to request.referrer, notice: 'Incomming invoice item was successfully updated.' }
        format.json { render :show, status: :ok, location: @ininvoice.ininvoice_item }
      else
        format.html { render :edit }
        format.json { render json: @ininvoice.ininvoice_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ininvoice = Ininvoice.find(params[:ininvoice_id])
    @ininvoice.ininvoice_item.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Incomming invoice item was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_ininvoice_item
      @ininvoice_item = IninvoiceItem.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ininvoice_item_params
      params.require(:ininvoice_item).permit(:amount, :note, :ininvoice_id, :item_id, :user_id)
    end
end    