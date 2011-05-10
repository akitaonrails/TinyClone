require 'spec_helper'

describe "links/index.html.haml" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :identifier => "Identifier"
      ),
      stub_model(Link,
        :identifier => "Identifier"
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  end
end
