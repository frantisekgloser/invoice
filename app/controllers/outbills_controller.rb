class OutbillsController < ApplicationController
  before_action :set_outbill, only: [:show, :edit, :update, :destroy]

  # GET /outbills
  # GET /outbills.json
  def index
    @outbill = Outbill.all
  end

  # GET /outbill/1
  # GET /outbill/1.json
  def show
  end

  # GET /outbill/new
  def new
    @outbill = Outbill.new
  end

  # GET /outbills/1/edit
  def edit
  end

  # POST /outbills
  # POST /outbills.json
  def create
    @outbill = Outbill.new(outbill_params)

    respond_to do |format|
      if @outbill.save
        format.html { redirect_to @outbill, notice: 'Outgoing bill was successfully created.' }
        format.json { render :show, status: :created, location: @outbill }
      else
        format.html { render :new }
        format.json { render json: @outbill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /outbills/1
  # PATCH/PUT /outbills/1.json
  def update
    respond_to do |format|
      if @outbill.update(outbill_params)
        format.html { redirect_to @outbill, notice: 'Outgoing bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @outbill }
      else
        format.html { render :edit }
        format.json { render json: @outbill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outbills/1
  # DELETE /outbills/1.json
  def destroy
    @outbill.destroy
    respond_to do |format|
      format.html { redirect_to outbills_url, notice: 'Outgoing bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outbill
      @outbill = Outbill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outbill_params
      params.require(:outbill).permit(:name, :title, :content)
    end
end
