class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  
  before_filter :check_access, :except => [:show, :index, :list]
  before_filter :find_page, only: [:show, :edit, :update, :destroy]
  after_filter :process_tags, only: [:create, :update]
  
  layout "layout-pages"

  def index
    @page = Page.find_by_slug!('home')
    @comments = false
    @members = CompanyMember.all
    # MixPanel Page Tracking
    if Rails.env.production?
      if user_signed_in?
        mixpanel.track 'Page Loaded', { :page_title => "Lab", :distinct_id => current_user.id,  :user => "Registered" }
      else
        mixpanel.track 'Page Loaded', { :page_title => "Lab", :user => "Unregistered" }
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @page }
    end
  end

  def list
    @pages = Page.search(params[:search])
    if params[:search]
      @search = params[:search]
    end
    @page = false
    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    # MixPanel Page Tracking
    if Rails.env.production?
      if user_signed_in?
        mixpanel.track 'Page Loaded', { :page_title => @page.name, :distinct_id => current_user.id,  :user => "Registered" }
      else
        mixpanel.track 'Page Loaded', { :page_title => @page.name, :user => "Unregistered" }
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new
    @tags = Tag.all
    respond_to do |format|
      format.html 
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        
        # mixpanel track page created
        if Rails.env.production?
          mixpanel.track 'Page Created', { :distinct_id => current_user.id }
        end
        
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
  
  def find_page
    @page = Page.find_by_slug!(params[:id].split("/").last)
  end
  
  def process_tags
    @page.taggings.each do |old_tag|
      old_tag.destroy
    end
    if params[:hiddenTagList]
      tags = params[:hiddenTagList].split(",")
      tags.each do |t|
        tag = Tag.find_by_name(t.downcase)
        if(tag.class != Tag)
          tag = Tag.create!(:name => t.downcase)
        end
        @page.taggings.create!(:tag_id => tag.id)
      end
    end
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
