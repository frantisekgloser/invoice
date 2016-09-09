class IncomeReportsController < ApplicationController
  before_action :set_income_report, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @income_reports = policy_scope(IncomeReport)
  end

  def show
  end

  def new
    @income_report = current_user.income_reports.build
  end

  def edit
  end

  def create
    @income_report = current_user.income_reports.build(income_report_params)
    respond_to do |format|
      if @income_report.save
        format.html { redirect_to income_reports_url, notice: 'Income report successfully created.' }
        format.json { render :show, status: :created, location: @income_report }
      else
        format.html { render :new }
        format.json { render json: @income_report.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @income_report.update(income_report_params)
        format.html { redirect_to income_reports_url, notice: 'Income report was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_report }
      else
        format.html { render :edit }
        format.json { render json: @income_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @income_report.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to income_reports_url, notice: 'Income report was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Income report was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_income_report
      @income_report = IncomeReport.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def income_report_params
      params.require(:income_report).permit(:number, :date, :to_pay, :to_receive, :note, :user_id)
    end
end    