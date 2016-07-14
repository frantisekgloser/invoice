class ReportTypesController < ApplicationController
  before_action :set_report_type, only: [:show, :edit, :update, :destroy]
#  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @report_types = current_user.report_types.all
  end

  def show
  end

  def new
    @report_type = current_user.report_types.build
  end

  def edit
  end

  def create
    @report_type = current_user.report_types.build(report_type_params)
    respond_to do |format|
      if @report_type.save
        format.html { redirect_to @report_type, notice: 'Report type successfully created.' }
        format.json { render :show, status: :created, location: @report_type }
      else
        format.html { render :new }
        format.json { render json: @report_type.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @report_type.update(report_type_params)
        format.html { redirect_to report_types_url, notice: 'Report type was successfully updated.' }
#        format.html { redirect_to @report_type, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_type }
      else
        format.html { render :edit }
        format.json { render json: @report_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report_type.destroy
    respond_to do |format|
      format.html { redirect_to report_types_url, notice: 'Report type was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_report_type
      @report_type = ReportType.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def report_type_params
      params.require(:report_type).permit(:name, :user_id)
    end
end    