class TasksController < ApplicationController

  attr_accessor :completed

  before_filter :find_list  , :except => [:new]
  respond_to :html, :xml, :js

  def new
  @task = Task.new
  end




  def create
    @task = @list.tasks.new(params[:task])

    if @task.save
      flash[:message] = "task created"
      redirect_to list_url(@list)
    else
      flash[:message] = "task not created"
      redirect_to list_url(@list)
    end

  end

  def complete
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_url(@list)
  end

  def destroy
    puts "Call to destroy"
    @task = @list.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task deleted"
      redirect_to task_url(@list)
    else
      flash[:error] =" Task not deleted"
      redirect_to task_url(@list)
    end
  end

  def list_all_tasks
    respond_with(@tasks = Task.all)
  end

  def index
=begin
    if params[:search]
      @tasks = @list.tasks.find(:all, :conditions => ['description LIKE ?', "%#{params[:search]}%"])

    else
      @tasks = Task.find(:all)
    end
=end
  @task = @list.Task.search(params[:search])
    redirect_to list_all_tasks

  end

  private
  def find_list
      @list = List.find(params[:list_id])
  end
end
