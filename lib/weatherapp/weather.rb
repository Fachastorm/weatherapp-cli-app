class Weatherapp::Weather

  attr_accessor :cities, :state, :url, :name

  def initialize(state)
    @state = state
    @cities = []
  end

  def city_list
    html = open("https://www.wunderground.com/cgi-bin/findweather/getForecast?query=#{@state}")
    doc = Nokogiri::HTML(open(html).read)
      doc.css("tbody tr").each do |w|
       city = w.css("a").text
       url = w.css("a").attr("href").value
      @cities << "#{city} : #{url}"
    end
    @cities
  end

end
