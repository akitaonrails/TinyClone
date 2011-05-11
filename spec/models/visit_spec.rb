require 'spec_helper'

describe Visit do
  before(:each) do 
    @link = Link.shorten("http://www.google.com")
  end

  it "should save a visit with country information" do
    @visit = Visit.create(:ip => "174.122.43.78")
    @visit.country.should == "US"
  end
end
