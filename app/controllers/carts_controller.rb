class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to home_url, notice: 'Your Cart is Currently empty!' }
      format.json { head :no_content }
    end
  end

  def checkout
    @cart = find_cart

    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts @cart
    if @cart
      session[:cart_id] = nil
    end
    @user = User.find_by_remember_token(cookies[:remember_token])
    # find_by_remember_token(cookies[:remember_token])
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts @user
    # @cart = Cart.find(session[:cart_id])   
    UserMailer.checkout_confirm(@user).deliver
    respond_to do |format|

      format.html { redirect_to root_url }
      format.json { head :no_content }
    end

  end

  # def save_order
  #   @cart = find_cart
  #   puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  #   @order = Order.new(params[:order])

  #   @order.add_line_items_from_cart(@cart)

  #   if @order.save
  #   session[:cart] = nil
    
  #   else
  #   render :action => 'checkout'
  #   end
  # end

  private
  def find_cart
    session[:cart_id] ||= Cart.new
  end

end
