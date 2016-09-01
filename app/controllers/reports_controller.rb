class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @reports = policy_scope(Report)
  end

  def show
  end

  def new
    @report = current_user.reports.build
  end

  def edit
  end

  def create
    @report = current_user.reports.build(report_params)
    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_url, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to reports_url, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_report
      @report = Report.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:date, :to_pay, :to_receive, :report_type_id, :user_id)
    end
end    