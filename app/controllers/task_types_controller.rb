class TaskTypesController < ApplicationController
  before_action :set_task_type, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
  skip_after_action :verify_authorized, only: :index

  def index
    @task_types = policy_scope(TaskType)
  end

  def show
  end

  def new
    @task_type = current_user.task_types.build
  end

  def edit
  end

  def create
    @task_type = current_user.task_types.build(task_type_params)
    respond_to do |format|
      if @task_type.save
        format.html { redirect_to @task_type, notice: 'Task type successfully created.' }
        format.json { render :show, status: :created, location: @task_type }
      else
        format.html { render :new }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    respond_to do |format|
      if @task_type.update(task_type_params)
        format.html { redirect_to task_types_url, notice: 'Task type was successfully updated.' }
#        format.html { redirect_to @task_type, notice: 'Incomming invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_type }
      else
        format.html { render :edit }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_type.destroy
    respond_to do |format|
      format.html { redirect_to task_types_url, notice: 'Task type was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  private
    def set_task_type
      @task_type = TaskType.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_type_params
      params.require(:task_type).permit(:name, :user_id)
    end
end    