class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @banks = policy_scope(Bank)
  end

  def show
  end

  def new
    @bank = current_user.banks.build
  end

  def edit
  end

  def create
    @bank = current_user.banks.build(bank_params)
    respond_to do |format|
      if @bank.save
        format.html { redirect_to banks_url, notice: 'Bank successfully created.' }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to banks_url, notice: 'Bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to banks_url, notice: 'Bank was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Bank was successfully destroyed.' }    
    end
      format.json { head :no_content }
  end
end

  private
    def set_bank
      @bank = Bank.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:name, :code, :swift, :user_id)
    end
end    