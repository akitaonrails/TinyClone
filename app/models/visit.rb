class Visit < ActiveRecord::Base
  belongs_to :link
  after_create :set_country

  def set_country
    xml = RestClient.get "http://api.hostip.info/get_xml.php?ip=#{ip}"  
    self.country = XmlSimple.xml_in(xml.to_s, { 'ForceArray' => false })['featureMember']['Hostip']['countryAbbrev']
    self.save
  end

  def self.count_days_bar(identifier,num_of_days)
    visits = count_by_date_with(identifier,num_of_days)
    data, labels = [], []
    visits.each do |visit| 
      data << visit[1]
      labels << "#{visit[0].day}/#{visit[0].month}"
    end
    "http://chart.apis.google.com/chart?chs=820x180&cht=bvs&chxt=x&chco=a4b3f4&chm=N,000000,0,-1,11&chxl=0:|#{labels.join('|')}&chds=0,#{data.sort.last+10}&chd=t:#{data.join(',')}"
  end

  def self.count_country_chart(identifier,map)
    countries, count = [], []
    count_by_country_with(identifier).each do |visit| 
      countries << visit.country
      count << visit.count
    end
    chart = {}
    chart[:map] = "http://chart.apis.google.com/chart?chs=440x220&cht=t&chtm=#{map}&chco=FFFFFF,a4b3f4,0000FF&chld=#{countries.join('')}&chd=t:#{count.join(',')}"
    chart[:bar] = "http://chart.apis.google.com/chart?chs=320x240&cht=bhs&chco=a4b3f4&chm=N,000000,0,-1,11&chbh=a&chd=t:#{count.join(',')}&chxt=x,y&chxl=1:|#{countries.reverse.join('|')}"
    return chart
  end

  def self.count_by_date_with(identifier,num_of_days)
    date_column = "date(visits.created_at)" # may differ in other dbs
    visits = Link.find(identifier).visits.
      select("#{date_column} as date, count(*) as count").
      where("visits.created_at between ? and ?", 
            (Time.now - num_of_days.days), (Time.now + 1) ).
      group(date_column)
    dates = (Date.today-num_of_days..Date.today)
    results = {}
    dates.each do |date|
      visits.select { |visit| visit.date == date }.map do |visit| 
        results[date] = visit.count
      end
      results[date] = 0 unless results[date]
    end
    results.sort.reverse    
  end

  def self.count_by_country_with(identifier)
    Link.find(identifier).visits.
      select("visits.country, count(*) as count").
      group("visits.country")
  end
end
