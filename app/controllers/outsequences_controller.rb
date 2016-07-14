class OutsequencesController < ApplicationController
  before_action :set_outsequence, only: [:show, :edit, :update, :destroy]
#  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @outsequences = current_user.outsequences.all
  end

  def show
  end

  def new
    @outsequence = current_user.outsequences.build
  end

  def edit
  end

  def create
    @outsequence = current_user.outsequences.build(outsequence_params)
    respond_to do |format|
      if @outsequence.save
        format.html { redirect_to @outsequence, notice: 'Outgoing sequence successfully created.' }
        format.json { render :show, status: :created, location: @outsequence }
      else
        format.html { render :new }
        format.json { render json: @outsequence.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @outsequence.update(outsequence_params)
        format.html { redirect_to outsequences_url, notice: 'Outgoing sequence was successfully updated.' }
#        format.html { redirect_to @outsequence, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @outsequence }
      else
        format.html { render :edit }
        format.json { render json: @outsequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outsequence.destroy
    respond_to do |format|
      format.html { redirect_to outsequences_url, notice: 'Outgoing sequence was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_outsequence
      @outsequence = Outsequence.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def outsequence_params
      params.require(:outsequence).permit(:name, :note, :user_id)
    end
end    