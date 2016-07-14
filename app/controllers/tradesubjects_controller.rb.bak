class TradeSubjectsController < ApplicationController
  before_action :set_tradeSubject, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
  end  

  def new
#    @tradeSubject = current_user.tradeSubjects.build
     @tradeSubject = current_user.TradeSubject.new
  end

  def create
#   @tradeSubject = current_user.tradeSubjects.new (params[:tradeSubject])
#    respond_to do |format|
#      if @tradeSubject.save
#        format.html { redirect_to @tradeSubject, notice: 'Trade Subject was successfully created.' }
#        format.json { render :show, status: :created, location: @tradeSubject }
#      else
#        format.html { render :new }
#        format.json { render json: @tradeSubject.errors, status: :unprocessable_entity }
#      end
#    end
  end

  def update
    tradeSubject = TradeSubject.find(params[:id])

    authorize user
    user.assign_attributes(user_params)

    if user.save
      render json: tradeSubject
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :identificationNumber, :VAT)
    end
end