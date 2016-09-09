class DayEntriesController < ApplicationController
  before_action :set_day_entry, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @day_entries = policy_scope(DayEntry)
  end

  def show
  end

  def new
    @day_entry = current_user.day_entries.build
  end

  def edit
  end

  def create
    @day_entry = current_user.day_entries.build(day_entry_params)
    respond_to do |format|
      if @day_entry.save
        format.html { redirect_to day_entries_url, notice: 'Day entry successfully created.' }
        format.json { render :show, status: :created, location: @day_entry }
      else
        format.html { render :new }
        format.json { render json: @day_entry.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @day_entry.update(day_entry_params)
        format.html { redirect_to day_entries_url, notice: 'Day entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_entry }
      else
        format.html { render :edit }
        format.json { render json: @day_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @day_entry.destroy
    respond_to do |format|
    if request.referrer == nil
      format.html { redirect_to day_entries_url, notice: 'Day entry was successfully destroyed.' }
    else
      format.html { redirect_to request.referrer, notice: 'Day entry was successfully destroyed.' }    
    end
    format.json { head :no_content }
  end
end

  private
    def set_day_entry
      @day_entry = DayEntry.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def day_entry_params
      params.require(:day_entry).permit(:date, :start, :stop, :invoiced, :task_id, :user_id)
    end
end    