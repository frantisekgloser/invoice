class IncommingInvoiceSequencesController < ApplicationController
  before_action :set_incomming_invoice_sequence, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @incomming_invoice_sequences = policy_scope(IncommingInvoiceSequence)
  end

  def show
  end

  def new
    @incomming_invoice_sequence = current_user.incomming_invoice_sequences.build
  end

  def edit
  end

  def create
    @incomming_invoice_sequence = current_user.incomming_invoice_sequences.build(incomming_invoice_sequence_params)
    respond_to do |format|
      if @incomming_invoice_sequence.save
        format.html { redirect_to incomming_invoice_sequences_url, notice: 'Incomming invoice sequence was successfully created.' }
        format.json { render :show, status: :created, location: @incomming_invoice_sequence }
      else
        format.html { render :new }
        format.json { render json: @incomming_invoice_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @incomming_invoice_sequence.update(incomming_invoice_sequence_params)
        format.html { redirect_to incomming_invoice_sequences_url, notice: 'Incomming invoice sequence was successfully updated.' }
        format.json { render :show, status: :ok, location: @incomming_invoice_sequence }
      else
        format.html { render :edit }
        format.json { render json: @incomming_invoice_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @incomming_invoice_sequence.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to incomming_invoice_sequences_url, notice: 'Incomming invoice sequence was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Incomming invoice sequence was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_incomming_invoice_sequence
      @incomming_invoice_sequence = IncommingInvoiceSequence.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def incomming_invoice_sequence_params
      params.require(:incomming_invoice_sequence).permit(:name, :note, :user_id)
    end
end    