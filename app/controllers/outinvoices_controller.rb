class OutinvoicesController < ApplicationController
  before_action :set_outinvoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /outinvoices
  # GET /outinvoices.json
  def index
    @outinvoice = Outinvoice.all
  end

  # GET /outinvoice/1
  # GET /outinvoice/1.json
  def show
  end

  # GET /outinvoice/new
  def new
    @outinvoice = current_user.outinvoices.build
  end

  # GET /outinvoices/1/edit
  def edit
  end

  # POST /outinvoices
  # POST /outinvoices.json
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

  # PATCH/PUT /outinvoices/1
  # PATCH/PUT /outinvoices/1.json
  def update
    respond_to do |format|
      if @outinvoice.update(outinvoice_params)
        format.html { redirect_to @outinvoice, notice: 'Outgoing invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @outinvoice }
      else
        format.html { render :edit }
        format.json { render json: @outinvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outinvoices/1
  # DELETE /outinvoices/1.json
  def destroy
    @outinvoice.destroy
    respond_to do |format|
      format.html { redirect_to outinvoices_url, notice: 'Outgoing invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outinvoice
      @outinvoice = Outinvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outinvoice_params
      params.require(:outinvoice).permit(:name, :title, :content)
    end
end
