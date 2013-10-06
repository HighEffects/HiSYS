class PostsController < ApplicationController
  
  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  before_filter :check_access, :except => [:show, :index]
  after_filter :process_tags, only: [:create, :update]
  
  layout "layout-blog"
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("created_at desc").all
    @post = false
    # Mix Panel Page Tracking
    if Rails.env.production?
      if user_signed_in?
        mixpanel.track 'Page Loaded', { :page_title => "Blog", :distinct_id => current_user.id,  :user => "Registered" }
      else
        mixpanel.track 'Page Loaded', { :page_title => "Blog", :user => "Unregistered" }
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def list
    @posts = Post.all
    @post = false
    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
    # Mix Panel Page Tracking
    if Rails.env.production?
      if user_signed_in?
        mixpanel.track 'Page Loaded', { :page_title => @post.title, :distinct_id => current_user.id,  :user => "Registered" }
      else
        mixpanel.track 'Page Loaded', { :page_title => @post.title, :user => "Unregistered" }
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @tags = Tag.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user

    respond_to do |format|
      if @post.save
        
        # mixpanel track post created
        if Rails.env.production?
          #mixpanel.track 'Post Created', { :distinct_id => current_user.id }
        end
        
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def find_post
    @post = Post.find_by_slug!(params[:id].split("/").last)
  end
  
  def process_tags
    @post.taggings.each do |old_tag|
      old_tag.destroy
    end
    if params[:hiddenTagList]
      tags = params[:hiddenTagList].split(",")
      tags.each do |t|
        tag = Tag.find_by_name(t.downcase)
        if(tag.class != Tag)
          tag = Tag.create!(:name => t.downcase)
        end
        @post.taggings.create!(:tag_id => tag.id)
      end
    end
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
