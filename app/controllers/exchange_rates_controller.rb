class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @exchange_rates = policy_scope(ExchangeRate)
  end

  def show
  end

  def new
    @exchange_rate = current_user.exchange_rates.build
  end

  def edit
  end

  def create
    @exchange_rate = current_user.exchange_rates.build(exchange_rate_params)
    respond_to do |format|
      if @exchange_rate.save
        format.html { redirect_to exchange_rates_url, notice: 'Exchange rate successfully created.' }
        format.json { render :show, status: :created, location: @exchange_rate }
      else
        format.html { render :new }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @exchange_rate.update(exchange_rate_params)
        format.html { redirect_to exchange_rates_url, notice: 'Exchange rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange_rate }
      else
        format.html { render :edit }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exchange_rate.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Exchange rate was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_exchange_rate
      @exchange_rate = ExchangeRate.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_rate_params
      params.require(:exchange_rate).permit(:rate, :date, :bank_id, :currency_id, :user_id)
    end
end    