class UploadsController < ApplicationController
  
  before_filter :check_access, :except => [:show, :index]
  after_filter :process_tags, only: [:create, :update]
  
  layout "layout-files"
  
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end
  
  def list
    @uploads = Upload.all

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])
    @commentable = @upload
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new
    @tags = Tag.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
    @tags = Tag.all
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    @upload.user_id = current_user.id

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
  
  def process_tags
    @upload.taggings.each do |old_tag|
      old_tag.destroy
    end
    if params[:hiddenTagList]
      tags = params[:hiddenTagList].split(",")
      tags.each do |t|
        tag = Tag.find_by_name(t.downcase)
        if(tag.class != Tag)
          tag = Tag.create!(:name => t.downcase)
        end
        @upload.taggings.create!(:tag_id => tag.id)
      end
    end
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
