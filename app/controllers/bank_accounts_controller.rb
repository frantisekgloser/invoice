class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @bank_accounts = policy_scope(BankAccount)
  end

  def show
  end

  def new
    @bank_account = current_user.bank_accounts.build
  end

  def edit
  end

  def create
    @bank_account = current_user.bank_accounts.build(bank_account_params)
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to bank_accounts_url, notice: 'Bank account successfully created.' }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to bank_accounts_url, notice: 'Bank account was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Bank account was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_account_params
      params.require(:bank_account).permit(:name, :number, :iban, :bank_id, :currency_id, :user_id)
    end
end    