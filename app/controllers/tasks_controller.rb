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

=begin
  def index
    puts "inside index.....1"
    if params[:search]
      @search = params[:search]
      puts "inside index.....2"
      puts @search
      @task = @list.tasks
      puts "@list.length #{@list}"
      puts @task
      @tasks= @task.find(:all, :conditions => ['description LIKE ?', "%#{params[:search]}%"] )
    else
      puts "inside index.....3"
      puts "@list: #{@list}"
      puts "@list.tasks: #{@list.tasks}"
      puts "params[:list_id]: #{params[:list_id]}"
      @tasks = @list.tasks
      puts "@tasks: #{@tasks}"
      puts "inside index.....4"
    end
  end
=end
    def index
     # @tasks = Task.search(params[:search],@list).paginate(:per_page => 4, :page => params[:page])
    #  @tasks = Task.order(params[:sort])
    #  @tasks = Task.order(params[:sort])
      @tasks = Task.search(params[:search],@list).paginate(:per_page => 4, :page => params[:page])
      #order(params[:sort])
    end
=begin
def search
    puts "inside index.....1"
    if params[:search]
      puts "inside index.....2"
      @tasks = @list.tasks.find(params[:list_id])
      puts "@List.length #{@list}"
      @task = @tasks.find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
    else
      puts "inside index.....3"
      puts "@list: #{@list}"
      puts "@list.tasks: #{@list.tasks}"
      puts "params[:list_id]: #{params[:list_id]}"
      #@tasks = @list.tasks.find(params[:list_id])
      @tasks = @list.tasks
      puts "@tasks: #{@tasks}"
      puts "inside index.....4"
    end
    #redirect_to tasks_url(@task)
    render "tasks/index"
  end
=end
=begin
   def show
     @task = @list.tasks.find(params[:list_id])
     redirect_to list_tasks_url(@task)
     end
=end

  private
  def find_list
      @list = List.find(params[:list_id])
  end
end
