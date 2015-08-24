class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user
  
  # GET /tasks
  def index
    @tasks = @user.tasks.order('complete, created_at DESC')
  end

  # GET /tasks/new
  def new
    @task =  @user.tasks.new
  end

  # POST /tasks
  def create
    @task =  @user.tasks.create(new_task_params)
    @success = @task.valid?
    if @success
      flash.now[:notice] = 'Task was successfully created.'
    else
      flash.now[:alert] = 'Task was not successfully created.'
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(update_task_params)
      @complete = @task.complete
      flash.now[:notice] = 'Task was successfully updated.'
    else
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    flash.now[:notice] = 'Task was successfully destroyed.'
  end

  private
    def set_user
      @user = current_user
    end

    def set_task
      @task =  Task.all.find(params[:id])
    end

    def new_task_params
      params.require(:task).permit(:title)
    end

    def update_task_params
      params.require(:task).permit(:complete)
    end
end
