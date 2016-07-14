class InsequencesController < ApplicationController
  before_action :set_insequence, only: [:show, :edit, :update, :destroy]
#  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @insequences = current_user.insequences.all
  end

  def show
  end

  def new
    @insequence = current_user.insequences.build
  end

  def edit
  end

  def create
    @insequence = current_user.insequences.build(insequence_params)
    respond_to do |format|
      if @insequence.save
        format.html { redirect_to @insequence, notice: 'Insequence successfully created.' }
        format.json { render :show, status: :created, location: @insequence }
      else
        format.html { render :new }
        format.json { render json: @insequence.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @insequence.update(insequence_params)
        format.html { redirect_to insequences_url, notice: 'Insequence was successfully updated.' }
#        format.html { redirect_to @insequence, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @insequence }
      else
        format.html { render :edit }
        format.json { render json: @insequence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @insequence.destroy
    respond_to do |format|
      format.html { redirect_to insequences_url, notice: 'Insequence was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_insequence
      @insequence = Insequence.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def insequence_params
      params.require(:insequence).permit(:name, :note, :user_id)
    end
end    