class TagsController < ApplicationController
  
  before_filter :find_tag, only: [:show]
  
  def index
    @tags = Tag.all
  end

  def show
    
  end
end


def find_tag
  @tag = Tag.find_by_name!(params[:id].split("/").last)
end