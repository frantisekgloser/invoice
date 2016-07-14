class VatReportsController < ApplicationController
  before_action :set_vat_report, only: [:show, :edit, :update, :destroy]
#  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @vat_reports = current_user.vat_reports.all
  end

  def show
  end

  def new
    @vat_report = current_user.vat_reports.build
  end

  def edit
  end

  def create
    @vat_report = current_user.vat_reports.build(vat_report_params)
    respond_to do |format|
      if @vat_report.save
        format.html { redirect_to @vat_report, notice: 'Vat report successfully created.' }
        format.json { render :show, status: :created, location: @vat_report }
      else
        format.html { render :new }
        format.json { render json: @vat_report.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @vat_report.update(vat_report_params)
        format.html { redirect_to vat_reports_url, notice: 'Vat report was successfully updated.' }
#        format.html { redirect_to @vat_report, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @vat_report }
      else
        format.html { render :edit }
        format.json { render json: @vat_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vat_report.destroy
    respond_to do |format|
      format.html { redirect_to vat_reports_url, notice: 'Vat report was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_vat_report
      @vat_report = VatReport.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def vat_report_params
      params.require(:vat_report).permit(:number, :date, :to_pay, :to_receive, :note, :user_id)
    end
end    