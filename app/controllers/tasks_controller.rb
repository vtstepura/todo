class TasksController < ApplicationController
  before_action :tasks, only: :index

  def new
    @task = Task.new
    render :show_form
  end

  def create
    @task = Task.create(task_params)
    @tasks = current_user.tasks
    render :hide_form
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = current_user.tasks
  end

  def edit
    @task = Task.find(params[:id])
    render :show_form
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    @tasks = current_user.tasks
    render :hide_form
  end

  def complete
    @task = Task.find(params[:id])
    @task.status ? @task.update(status: false) : @task.update(status: true)
    @tasks = current_user.tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed).merge(user: current_user)
  end

  def tasks
    if params[:status] == 'true'
      @tasks = current_user.tasks.completed
    elsif params[:status] == 'false'
      @tasks = current_user.tasks.active
    else
      @tasks = current_user.tasks
    end
  end
end
