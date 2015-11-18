require 'rubygems'
require 'solr'
require 'will_paginate/array'
class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
 
  def index

    @searches = search(params[:search],0)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
 def search(query, page)

 
    page = params[:page].to_i
    if page == 0
      page = 1
    end

    perpage = 10
    start = perpage * (page-1)

    solr = Solr::Connection.new('http://localhost:8080/apache-solr-3.6.2/core0', :autocommit => :on)

    queryobj = Solr::Request::Select.new(nil, {'q' => "name:\"#{query}\" OR info:\"#{query}\"",'rows' => perpage, 'start' => start})

    results = solr.send(queryobj).data["response"]

    @pages = (1..results["numFound"].to_i).to_a.paginate(page: page, per_page:perpage)

    @searches = results["docs"]
  end
end
