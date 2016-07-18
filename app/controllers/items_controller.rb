class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @items = policy_scope(Item)
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def edit
  end

  def create
    @item = current_user.items.build(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_url, notice: 'Item was successfully updated.' }
#        format.html { redirect_to @item, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :note, :unit_price, :currency_id, :vat_charge_id, :trade_subject_id, :user_id)
    end
end    