require 'spec_helper'

describe Visit do
  before(:each) do 
    @link = Link.shorten("http://www.google.com")
  end

  it "should save a visit with country information" do
    @visit = Visit.create(:ip => "174.122.43.78")
    @visit.country.should == "US"
  end

  it "should be able to group by country" do
    @link = Link.shorten("http://www.google.com")
    2.times { Visit.create(:link => @link, :country => "BR") }
    3.times { Visit.create(:link => @link, :country => "US") }
    1.times { Visit.create(:link => @link, :country => "AR") }
    countries = []
    count = []
    Visit.count_by_country_with(@link.id).each do |visit|
      countries << visit.country
      count << visit.count.to_s
    end
    countries.join(",").should == "AR,BR,US"
    count.join(",").should == "1,2,3"
  end

  it "should be able to group by date" do
    @date = Date.parse("2011-05-10")
    Date.stub(:today) { @date }
    @link = Link.shorten("http://www.google.com")
    2.times { Visit.create(:link => @link, :created_at => Date.today) }
    3.times { Visit.create(:link => @link, :created_at => Date.today - 2.days) }
    1.times { Visit.create(:link => @link, :created_at => Date.today - 5.days) }
    data = []
    labels = []
    Visit.count_by_date_with(@link.id, 7).each do |visit|
      data << visit[1]
      labels << visit[0][5..9]
    end
    data.join(",").should == "2,0,3,0,0,1,0,0"
    labels.join(",").should == "05-10,05-09,05-08,05-07,05-06,05-05,05-04,05-03"
  end
end
