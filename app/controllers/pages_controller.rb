class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  
  before_filter :find_page, only: [:show, :edit, :update, :destroy]
  
  layout "layout-pages"

  def index
    @page = Page.find_by_slug!('home')
    @comments = false
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html 
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit

  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
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
  
  
end
