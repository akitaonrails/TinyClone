require "spec_helper"

describe LinksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/links" }.should route_to(:controller => "links", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/links/new" }.should route_to(:controller => "links", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/links/1" }.should route_to(:controller => "links", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/links/1/edit" }.should route_to(:controller => "links", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/links" }.should route_to(:controller => "links", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/links/1" }.should route_to(:controller => "links", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/links/1" }.should route_to(:controller => "links", :action => "destroy", :id => "1")
    end

  end
end
