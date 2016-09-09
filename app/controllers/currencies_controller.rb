class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @currencies = policy_scope(Currency)
  end

  def show
  end

  def new
    @currency = current_user.currencies.build
  end

  def edit
  end

  def create
    @currency = current_user.currencies.build(currency_params)
    respond_to do |format|
      if @currency.save
        format.html { redirect_to currencies_url, notice: 'Currency successfully created.' }
        format.json { render :show, status: :created, location: @currency }
      else
        format.html { render :new }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to currencies_url, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @currency }
      else
        format.html { render :edit }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @currency.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to currencies_url, notice: 'Currency was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Currency was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_currency
      @currency = Currency.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name, :user_id)
    end
end    