class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  
  layout "layout-projects"
  
  def index
    if user_signed_in?
      @projects = Project.all
    else
      @projects = Project.find_all_by_visibility("public")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        # Create Permissions for project owner
        @owner = ProjectMember.new
        @owner.project_id = @project.id
        @owner.user_id = current_user.id
        @owner.role = "owner"
        @owner.access = "all"
        if @owner.save
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render json: @project, status: :created, location: @project }
        else
          format.html { render action: "new" }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.project_members.find_by_user_id(current_user.id) != nil
        if @project.project_members.find_by_user_id(current_user.id).role == "owner"
          @project.destroy
          format.html { redirect_to projects_url }
          format.json { head :no_content }
        else
          format.html { redirect_to projects_url, alert: 'You dont have permission to delete the selected project.'  }
          format.json { head :no_content, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to projects_url, alert: 'You dont have permission to delete the selected project.'  }
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end
  end
  
end
