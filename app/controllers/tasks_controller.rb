class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completed, :created_at)
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(task_params)
    redirect_to task_path(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_back fallback_location: :tasks_path
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    @task.toggle(:completed).save
    redirect_to tasks_path
  end
end

private

def task_params
  return params.require(:task).permit(:title, :description, :due_date, :completed)
end
