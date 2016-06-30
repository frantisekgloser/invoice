class OutbillsController < ApplicationController
  before_action :set_outbill, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outbills = policy_scope(Outbill)
  end

  def show?
  end

  def new
    @outbill = current_user.outbills.build
  end

  def edit
  end

  def create
    @outbill = current_user.outbills.build(outbill_params)
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

 def update
    respond_to do |format|
      if @outbill.update(outbill_params)
        format.html { redirect_to outbills_url, notice: 'Outgoing bill was successfully updated.' }
#        format.html { redirect_to @outbill, notice: 'Outgoing bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @outbill }
      else
        format.html { render :edit }
        format.json { render json: @outbill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outbill.destroy
    respond_to do |format|
      format.html { redirect_to outbills_url, notice: 'Outgoing bill was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_outbill
      @outbill = Outbill.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outbill_params
      params.require(:outbill).permit(:name, :title, :content, :user_id)
    end
end    