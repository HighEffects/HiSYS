class WebstoreController < ApplicationController
  
  before_filter :find_product, only: [:show]
  
  def index
    @items = Item.find_all_by_category('Product')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  
  def find_product
    @item = Item.find_by_slug!(params[:id].split("/").last)
  end
  
end
