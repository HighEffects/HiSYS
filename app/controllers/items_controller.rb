class ItemsController < ApplicationController
  
  before_filter :find_item, only: [:show, :edit, :update, :destroy]
  before_filter :check_access, :except => [:show, :index]
  after_filter :process_tags, only: [:create, :update]
 
  layout "layout-items"

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  # GET /items
  # GET /items.json
  def list
    @items = Item.all

    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @commentable = @item
    @comments = @commentable.comments
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
     @tags = Tag.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  
  def process_tags
    @item.taggings.each do |old_tag|
      old_tag.destroy
    end
    if params[:hiddenTagList]
      tags = params[:hiddenTagList].split(",")
      tags.each do |t|
        tag = Tag.find_by_name(t.downcase)
        if(tag.class != Tag)
          tag = Tag.create!(:name => t.downcase)
        end
        @item.taggings.create!(:tag_id => tag.id)
      end
    end
  end
  
  def find_item
    @item = Item.find_by_slug!(params[:id].split("/").last)
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
