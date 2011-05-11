require "spec_helper"

describe LinksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/links" }.should route_to(:controller => "links", :action => "index")
      { :get => "/" }.should route_to(:controller => "links", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/links/1" }.should route_to(:controller => "links", :action => "show", :id => "1")
    end

    it "recognizes and generates #info" do
      { :get => "/links/1/info" }.should route_to(:controller => "links", :action => "info", :id => "1")
      { :get => "/links/1/info/10" }.should route_to(:controller => "links", :action => "info", :id => "1", :num_of_days => "10")
      { :get => "/links/1/info/10/world" }.should route_to(:controller => "links", :action => "info", :id => "1", :num_of_days => "10", :map => "world")
    end

    it "recognizes and generates #create" do
      { :post => "/links" }.should route_to(:controller => "links", :action => "create")
    end

  end
end
