class CommentsController < ApplicationController
  
  before_filter :load_commentable
  
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
      klass = [Post, Page].detect { |c| params["#{c.name.underscore}_id"]}
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
      klass = [Post, Page].detect { |c| params["#{c.name.underscore}_id"]}
      @commentable = klass.find_by_slug!(params["#{klass.name.underscore}_id"])
    end
  
end
