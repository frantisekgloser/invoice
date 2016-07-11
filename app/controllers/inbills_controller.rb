class InbillsController < ApplicationController
  before_action :set_inbill, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @inbills = policy_scope(Inbill)
  end

  def show
  end

  def new
    @inbill = current_user.inbills.build
  end

  def edit
  end

  def create
    @inbill = current_user.inbills.build(inbill_params)
    respond_to do |format|
      if @inbill.save
        format.html { redirect_to @inbill, notice: 'Incomming bill was successfully created.' }
        format.json { render :show, status: :created, location: @inbill }
      else
        format.html { render :new }
        format.json { render json: @inbill.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @inbill.update(inbill_params)
        format.html { redirect_to inbills_url, notice: 'Incomming bill was successfully updated.' }
#        format.html { redirect_to @inbill, notice: 'Incomming bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @inbill }
      else
        format.html { render :edit }
        format.json { render json: @inbill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inbill.destroy
    respond_to do |format|
      format.html { redirect_to inbills_url, notice: 'Incomming bill was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_inbill
      @inbill = Inbill.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def inbill_params
      params.require(:inbill).permit(:name, :title, :content, :user_id)
    end
end    