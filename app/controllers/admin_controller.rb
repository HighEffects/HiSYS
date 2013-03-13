class AdminController < ApplicationController

  before_filter :check_access

  layout "layout-admin"

  def index
    @total_users = User.count
    @total_pages = Page.count
    @total_posts = Post.count
    @total_files = Upload.count
    @total_items = Item.count
    @total_assets = Asset.count
    @total_locations = Location.count
    @total_comments = Comment.count
    respond_to do |format|
      format.html # index.html.erb
      format.json
    end
  end
  
  def slides
    @slides = Slide.order("position")

    respond_to do |format|
      format.html { render :template => "slides/list" }
      format.json { render json: @slides }
    end
  end
  
  def support_messages
    @support_messages = SupportMessage.all

    respond_to do |format|
      format.html { render :template => "support_messages/list" }
      format.json { render json: @support_messages }
    end
  end
  
  def user_list
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def locations_list
    @locations = Location.all
    respond_to do |format|
      format.html { render :template => "locations/index" }
      format.json { render json: @assets }
    end
  end
  
  def page_list
    @pages = Page.all
    respond_to do |format|
      format.html { render :template => "pages/list" }
      format.json { render json: @pages }
    end
  end
  
  def post_list
    @posts = Post.all
    respond_to do |format|
      format.html { render :template => "posts/list" }
      format.json { render json: @posts }
    end
  end
  
  def upload_list
    @uploads = Upload.all
    respond_to do |format|
      format.html { render :template => "uploads/list" }
      format.json { render json: @uploads }
    end
  end

  def items_list
    @items = Item.all
    respond_to do |format|
      format.html { render :template => "items/list" }
      format.json { render json: @uploads }
    end
  end
  
  def assets_list
    @assets = Asset.all
    respond_to do |format|
      format.html { render :template => "assets/index" }
      format.json { render json: @uploads }
    end
  end
  
  def comment_list
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    else
      if current_user.admin != true
        redirect_to(pages_path, alert: 'You dont have access to that page!')
      end
    end
  end

end