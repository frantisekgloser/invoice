class IninvoicesController < ApplicationController
  before_action :set_ininvoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /ininvoices
  # GET /ininvoices.json
  def index
    @ininvoice = Ininvoice.all
  end

  # GET /ininvoice/1
  # GET /ininvoice/1.json
  def show
  end

  # GET /ininvoice/new
  def new
    @ininvoice = current_user.ininvoices.build
  end

  # GET /ininvoices/1/edit
  def edit
  end

  # POST /ininvoices
  # POST /ininvoices.json
  def create
    @ininvoice = current_user.ininvoices.build(ininvoice_params)

    respond_to do |format|
      if @ininvoice.save
        format.html { redirect_to @ininvoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @ininvoice }
      else
        format.html { render :new }
        format.json { render json: @ininvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ininvoices/1
  # PATCH/PUT /ininvoices/1.json
  def update
    respond_to do |format|
      if @ininvoice.update(ininvoice_params)
        format.html { redirect_to @ininvoice, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @ininvoice }
      else
        format.html { render :edit }
        format.json { render json: @ininvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ininvoices/1
  # DELETE /ininvoices/1.json
  def destroy
    @ininvoice.destroy
    respond_to do |format|
      format.html { redirect_to ininvoices_url, notice: 'Incomming invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ininvoice
      @ininvoice = Ininvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ininvoice_params
      params.require(:ininvoice).permit(:name, :title, :content)
    end
end
