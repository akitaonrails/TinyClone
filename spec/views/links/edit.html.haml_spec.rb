require 'spec_helper'

describe "links/edit.html.haml" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :identifier => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => links_path(@link), :method => "post" do
      assert_select "input#link_identifier", :name => "link[identifier]"
    end
  end
end
