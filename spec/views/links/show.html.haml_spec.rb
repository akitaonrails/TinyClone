require 'spec_helper'

describe "links/show.html.haml" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :identifier => "Identifier"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Identifier/)
  end
end
