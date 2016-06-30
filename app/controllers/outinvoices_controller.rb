class OutinvoicesController < ApplicationController
  before_action :set_outinvoice, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outinvoices = policy_scope(Outinvoice)
  end

  def show?
  end

  def new
    @outinvoice = current_user.outinvoices.build
  end

  def edit
  end

  def create
    @outinvoice = current_user.outinvoices.build(outinvoice_params)
    respond_to do |format|
      if @outinvoice.save
        format.html { redirect_to @outinvoice, notice: 'Outgoing invoice was successfully created.' }
        format.json { render :show, status: :created, location: @outinvoice }
      else
        format.html { render :new }
        format.json { render json: @outinvoice.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outinvoice.update(outinvoice_params)
        format.html { redirect_to outinvoices_url, notice: 'Outgoing invoice was successfully updated.' }
#        format.html { redirect_to @outinvoice, notice: 'Outgoing invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @outinvoice }
      else
        format.html { render :edit }
        format.json { render json: @outinvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outinvoice.destroy
    respond_to do |format|
      format.html { redirect_to outinvoices_url, notice: 'Outgoing invoice was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_outinvoice
      @outinvoice = Outinvoice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outinvoice_params
      params.require(:outinvoice).permit(:name, :title, :content, :user_id)
    end
end    