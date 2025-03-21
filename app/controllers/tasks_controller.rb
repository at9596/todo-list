class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]

  def index
    @tasks = Task.order(priority: :desc, due_date: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully!'
      # format.turbo_stream
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end
  def show; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task deleted successfully!'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :status, :progress)
  end
end