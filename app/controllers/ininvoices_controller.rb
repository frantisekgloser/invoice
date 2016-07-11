class IninvoicesController < ApplicationController
  before_action :set_ininvoice, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @ininvoices = policy_scope(Ininvoice)
  end

  def show
  end

  def new
    @ininvoice = current_user.ininvoices.build
  end

  def edit
  end

  def create
    @ininvoice = current_user.ininvoices.build(ininvoice_params)
    respond_to do |format|
      if @ininvoice.save
        format.html { redirect_to @ininvoice, notice: 'Incomming invoice was successfully created.' }
        format.json { render :show, status: :created, location: @ininvoice }
      else
        format.html { render :new }
        format.json { render json: @ininvoice.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @ininvoice.update(ininvoice_params)
        format.html { redirect_to ininvoices_url, notice: 'Incomming invoice was successfully updated.' }
#        format.html { redirect_to @ininvoice, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @ininvoice }
      else
        format.html { render :edit }
        format.json { render json: @ininvoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ininvoice.destroy
    respond_to do |format|
      format.html { redirect_to ininvoices_url, notice: 'Incomming invoice was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_ininvoice
      @ininvoice = Ininvoice.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ininvoice_params
      params.require(:ininvoice).permit(:name, :title, :content, :user_id)
    end
end    