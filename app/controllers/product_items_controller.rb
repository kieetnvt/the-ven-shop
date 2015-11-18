class ProductItemsController < ApplicationController
  # GET /product_items
  # GET /product_items.json
  def index
    @product_items = ProductItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_items }
    end
  end

  # GET /product_items/1
  # GET /product_items/1.json
  def show
    @product_item = ProductItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_item }
    end
  end

  # GET /product_items/new
  # GET /product_items/new.json
  def new
    @product_item = ProductItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_item }
    end
  end

  # GET /product_items/1/edit
  def edit
    @product_item = ProductItem.find(params[:id])
  end

  # POST /product_items
  # POST /product_items.json
  def create
    @product_item = ProductItem.new(params[:product_item])

    respond_to do |format|
      if @product_item.save
        format.html { redirect_to @product_item, notice: 'Product item was successfully created.' }
        format.json { render json: @product_item, status: :created, location: @product_item }
      else
        format.html { render action: "new" }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_items/1
  # PUT /product_items/1.json
  def update
    @product_item = ProductItem.find(params[:id])

    respond_to do |format|
      if @product_item.update_attributes(params[:product_item])
        format.html { redirect_to @product_item, notice: 'Product item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_items/1
  # DELETE /product_items/1.json
  def destroy
    @product_item = ProductItem.find(params[:id])
    @product_item.destroy

    respond_to do |format|
      format.html { redirect_to product_items_url }
      format.json { head :no_content }
    end
  end
end
