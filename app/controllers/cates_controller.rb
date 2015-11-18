require 'will_paginate/array'
class CatesController < ApplicationController
  # GET /cates
  # GET /cates.json
  def index
    @cates = Cate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cates }
    end
  end

  # GET /cates/1
  # GET /cates/1.json
  def show
    @cate = Cate.find(params[:id])

    @products = Product.find(:all, :conditions => {:cate_name => @cate.cate_name}).paginate(:page => params[:page], :per_page => 10)

   respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cate }
    end
  end

  # GET /cates/new
  # GET /cates/new.json
  def new
    @cate = Cate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cate }
    end
  end

  # GET /cates/1/edit
  def edit
    @cate = Cate.find(params[:id])
  end

  # POST /cates
  # POST /cates.json
  def create
    @cate = Cate.new(params[:cate])

    respond_to do |format|
      if @cate.save
        format.html { redirect_to @cate, notice: 'Cate was successfully created.' }
        format.json { render json: @cate, status: :created, location: @cate }
      else
        format.html { render action: "new" }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cates/1
  # PUT /cates/1.json
  def update
    @cate = Cate.find(params[:id])

    respond_to do |format|
      if @cate.update_attributes(params[:cate])
        format.html { redirect_to @cate, notice: 'Cate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cates/1
  # DELETE /cates/1.json
  def destroy
    @cate = Cate.find(params[:id])
    @cate.destroy

    respond_to do |format|
      format.html { redirect_to cates_url }
      format.json { head :no_content }
    end
  end
end
