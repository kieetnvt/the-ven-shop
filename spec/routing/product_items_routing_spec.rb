require "spec_helper"

describe ProductItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/product_items").should route_to("product_items#index")
    end

    it "routes to #new" do
      get("/product_items/new").should route_to("product_items#new")
    end

    it "routes to #show" do
      get("/product_items/1").should route_to("product_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_items/1/edit").should route_to("product_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_items").should route_to("product_items#create")
    end

    it "routes to #update" do
      put("/product_items/1").should route_to("product_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_items/1").should route_to("product_items#destroy", :id => "1")
    end

  end
end
