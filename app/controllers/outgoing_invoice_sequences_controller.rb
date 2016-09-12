class OutgoingInvoiceSequencesController < ApplicationController
  before_action :set_outgoing_invoice_sequence, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outgoing_invoice_sequences = policy_scope(OutgoingInvoiceSequence)
  end

  def show
  end

  def new
    @outgoing_invoice_sequence = current_user.outgoing_invoice_sequences.build
  end

  def edit
  end

  def create
    @outgoing_invoice_sequence = current_user.outgoing_invoice_sequences.build(outgoing_invoice_sequence_params)
    respond_to do |format|
      if @outgoing_invoice_sequence.save
        format.html { redirect_to outgoing_invoice_sequences_url, notice: 'Outgoing invoice sequence was successfully created.' }
        format.json { render :show, status: :created, location: @outgoing_invoice_sequence }
      else
        format.html { render :new }
        format.json { render json: @outgoing_invoice_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outgoing_invoice_sequence.update(outgoing_invoice_sequence_params)
        format.html { redirect_to outgoing_invoice_sequences_url, notice: 'Outgoing invoice sequence was successfully updated.' }
        format.json { render :show, status: :ok, location: @outgoing_invoice_sequence }
      else
        format.html { render :edit }
        format.json { render json: @outgoing_invoice_sequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outgoing_invoice_sequence.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to outgoing_invoice_sequences_url, notice: 'Outgoing invoice sequence was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Outgoing invoice sequence was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_outgoing_invoice_sequence
      @outgoing_invoice_sequence = OutgoingInvoiceSequence.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_invoice_sequence_params
      params.require(:outgoing_invoice_sequence).permit(:name, :note, :user_id)
    end
end    