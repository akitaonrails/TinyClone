require 'spec_helper'

describe "links/new.html.haml" do
  before(:each) do
    assign(:link, stub_model(Link,
      :identifier => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => links_path, :method => "post" do
      assert_select "input#link_identifier", :name => "link[identifier]"
    end
  end
end
