class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def edit
  end

  def update
    @task.update(
      title: params[:task][:title],
      details: params[:task][:details],
      completed: params[:task][:completed]
    )

    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :address)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
