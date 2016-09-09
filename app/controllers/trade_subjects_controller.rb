class TradeSubjectsController < ApplicationController
  before_action :set_trade_subject, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @trade_subjects = policy_scope(TradeSubject)
  end

  def show
  end

  def new
    @trade_subject = current_user.trade_subjects.build
  end

  def edit
  end

  def create
    @trade_subject = current_user.trade_subjects.build(trade_subject_params)
    respond_to do |format|
      if @trade_subject.save
        format.html { redirect_to trade_subjects_url, notice: 'Trade subject successfully created.' }
        format.json { render :show, status: :created, location: @trade_subject }
      else
        format.html { render :new }
        format.json { render json: @trade_subject.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @trade_subject.update(trade_subject_params)
        format.html { redirect_to trade_subjects_url, notice: 'Trade subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_subject }
      else
        format.html { render :edit }
        format.json { render json: @trade_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trade_subject.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to trade_subjects_url, notice: 'Trade subject was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Trade subject was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_trade_subject
      @trade_subject = TradeSubject.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_subject_params
      params.require(:trade_subject).permit(:name, :identification_number, :vat, :user_id)
    end
end    