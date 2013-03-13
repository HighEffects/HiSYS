class CommentsController < ApplicationController
  
  before_filter :load_commentable
  before_filter :check_access, :except => [:index]
  
  def index
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @comment = @commentable.comments.new
  end

  def create 
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user
    if @comment.save
      klass = [Post, Page, Upload, Item].detect { |c| params["#{c.name.underscore}_id"]}
      
      # mixpanel track comment created
      if Rails.env.production?
        mixpanel.track 'Comment Created', { :distinct_id => current_user.id }
      end
      
      if klass == Page
        redirect_to [@commentable, :comments], notice:"Comment created."
      else
        redirect_to @commentable, notice:"Comment created."
      end
    else
      render :new
    end
  end
  
  def load_commentable
      klass = [Post, Page, Upload, Item].detect { |c| params["#{c.name.underscore}_id"]}
      if klass == Post || klass == Page || klass == Item
        @commentable = klass.find_by_slug!(params["#{klass.name.underscore}_id"])
      else
        @commentable = klass.find_by_id!(params["#{klass.name.underscore}_id"])
      end
  end
  
  def check_access
    if user_signed_in? == false
      redirect_to(new_user_session_path, alert: 'You dont have access to that page!')
    end
  end
  
end
