require 'spec_helper'

describe Url do
  it "should save without problems" do
    Url.create(:original => "http://www.google.com").new_record?.should be_false
  end
end
