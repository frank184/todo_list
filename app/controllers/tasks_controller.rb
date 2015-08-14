class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    console
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(new_task_params)
    @success = @task.save
    if @success
      flash.now[:notice] = 'Task was successfully created.'
    else
      flash.now[:alert] = 'Task was not successfully created.'
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(update_task_params)
      flash.now[:notice] = 'Task was successfully updated.'
    else
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    flash.now[:notice] = 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def new_task_params
      params.require(:task).permit(:title)
    end

    def update_task_params
      params.require(:task).permit(:complete)
    end
end
