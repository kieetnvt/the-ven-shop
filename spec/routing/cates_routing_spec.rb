require "spec_helper"

describe CatesController do
  describe "routing" do

    it "routes to #index" do
      get("/cates").should route_to("cates#index")
    end

    it "routes to #new" do
      get("/cates/new").should route_to("cates#new")
    end

    it "routes to #show" do
      get("/cates/1").should route_to("cates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cates/1/edit").should route_to("cates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cates").should route_to("cates#create")
    end

    it "routes to #update" do
      put("/cates/1").should route_to("cates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cates/1").should route_to("cates#destroy", :id => "1")
    end

  end
end
