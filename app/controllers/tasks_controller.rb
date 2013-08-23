class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.task_list_id = TaskList.find_by_id(params[:task_list]).id
    @task.user_id = current_user.id
    @task.save
    respond_to do |format|
      format.html { render action: "edit" }
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @project = @task.task_list.project
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @project, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @project = @task.task_list.project
    if @project.project_members.find_by_user_id(current_user.id) != nil
      @user_role = @project.project_members.find_by_user_id(current_user.id).role
    else
      @user_role = "none"
    end
    respond_to do |format|
      if @user_role == "owner" || @user_role == "admin" || @user_role == "user"
        @task.destroy
        format.html { redirect_to @project, notice: 'Task was deleted.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @project, alert: 'You dont have enougth permissions to delete this task.' }
        format.json { head :no_content }
      end
    end
  end
  
end
