class ShoppingCartsController < ApplicationController
  # GET /shopping_carts
  # GET /shopping_carts.json
  
  before_filter :check_for_cart, only: [:index, :add_to_cart, :create_location, :select_payment_method, :checkout, :close_order]
  
  def index
    @cart_items = ShoppingCartItem.order("created_at desc").find_all_by_shopping_cart_id(@shopping_cart.id)
    @total = 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopping_carts }
    end
  end

  # GET /shopping_carts/1
  # GET /shopping_carts/1.json
  def show
    @shopping_cart = ShoppingCart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_cart }
    end
  end

  # GET /shopping_carts/new
  # GET /shopping_carts/new.json
  def new
    @shopping_cart = ShoppingCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_cart }
    end
  end

  # GET /shopping_carts/1/edit
  def edit
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  # POST /shopping_carts
  # POST /shopping_carts.json
  def create
    @shopping_cart = ShoppingCart.new(params[:shopping_cart])
    @shopping_cart.status = 'open'
    @shopping_cart.user_id = current_user.id

    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully created.' }
        format.json { render json: @shopping_cart, status: :created, location: @shopping_cart }
      else
        format.html { render action: "new" }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_carts/1
  # PUT /shopping_carts/1.json
  def update
    @shopping_cart = ShoppingCart.find(params[:id])

    respond_to do |format|
      if @shopping_cart.update_attributes(params[:shopping_cart])
        format.html { redirect_to shopping_carts_url, notice: 'Shopping cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_carts/1
  # DELETE /shopping_carts/1.json
  def destroy
    @shopping_cart = ShoppingCart.find(params[:id])
    @shopping_cart.destroy

    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
  
  # -----------------------------------------
  
  # Cart Controller
  
  def check_for_cart
    @shopping_cart = ShoppingCart.where(:status == "open").find_by_user_id(current_user.id)
    if @shopping_cart == nil
      shopping_cart = ShoppingCart.new
      shopping_cart.status = 'open'
      shopping_cart.user_id = current_user.id
      shopping_cart.save
      @shopping_cart = shopping_cart
    end
  end
  
  def add_to_cart
    if ShoppingCartItem.find_by_item_id(params[:item_id]) == nil
      cart_item = ShoppingCartItem.new
      cart_item.shopping_cart_id = @shopping_cart.id
      cart_item.item_id = params[:item_id]
      cart_item.quantity = 1
      cart_item.save
    
      respond_to do |format|
        format.html { redirect_to shopping_carts_url }
        format.json { head :no_content }
      end   
    else
      respond_to do |format|
        format.html { redirect_to shopping_carts_url, alert: "Este item ja esta em seu carrinho de compras"  }
        format.json { head :no_content }
      end
    end
  end
  
  def remove_from_cart
    cart_item = ShoppingCartItem.find(params[:id])
    cart_item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
  
  def add_quantity_from_cart_item
    cart_item = ShoppingCartItem.find(params[:id])
    cart_item.quantity = cart_item.quantity + 1
    cart_item.save
    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
  
  def subtract_quantity_from_cart_item
    cart_item = ShoppingCartItem.find(params[:id])
    if cart_item.quantity > 1
      cart_item.quantity = cart_item.quantity - 1
      cart_item.save
    end
    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      format.json { head :no_content }
    end
  end
  
  # -------------------------------------------------
  
  # Checkout
  
  def checkout
    # Check if Shipping Address is set
    respond_to do |format|
      if @shopping_cart.location == nil
        format.html { redirect_to action: 'create_location'}      
        format.json { head :no_content }    
      end 
      if @shopping_cart.payment_method != nil
        format.html 
        format.json { head :no_content }
      else
        format.html { redirect_to action: 'select_payment_method'}      
        format.json { head :no_content }    
      end
    end
  end
  
  def close_order
    @shopping_cart.status = 'shipping'
    @shopping_cart.save
    respond_to do |format|
      format.html 
      format.json { render json: @location }
    end
  end
  
  # -------------------------------------------------
  
  def create_location
    @location = Location.new
    respond_to do |format|
      format.html 
      format.json { render json: @location }
    end
  end
  
  def select_payment_method
    respond_to do |format|
      format.html 
      format.json { head :no_content }
    end
  end
  
end
