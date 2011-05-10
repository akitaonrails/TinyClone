require 'spec_helper'

describe Link do
  before do
    @url = "http://www.akitaonrails.com"
  end

  it "should create a shortened link for URL" do
    link = Link.shorten(@url)
    link.id.should_not be_nil
    link.new_record?.should be_false
  end

  it "should return the same shortened link for repeated URL" do
    link = Link.shorten(@url)
    link2 = Link.shorten(@url)
    link.id.should == link2.id
  end

  it "should return a customized link for a URL" do
    link = Link.shorten(@url, "blah-blah")
    link.id.should == "blah-blah"
  end

  it "should return a default link if the custom link is not available" do
    link = Link.shorten(@url, "blah-blah")
    link2 = Link.shorten("http://www.google.com", "blah-blah")
    link.id.should == "blah-blah"
    link2.id.should_not == "blah-blah"
  end
end
