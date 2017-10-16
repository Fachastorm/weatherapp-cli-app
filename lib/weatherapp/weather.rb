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
       name = w.css("a").text
       url = w.css("a").attr("href").value
       new_city = Weatherapp::City.new(name, url)
      @cities << new_city
    end
    @cities
  end

  def citys_weather(city)
    html = open("https://www.wunderground.com/#{city.url}")
    doc = Nokogiri::HTML(html)
    
    city.temperature = doc.search("span.test-true span.wu-value.wu-value-to").first.text
    city.conditions =  doc.search("div.condition-icon.small-6 p").text
    city.wind = doc.search("div.condition-wind p strong").first.text
    city.speed = doc.search("div.wind-speed strong").text
    city.tomorrow_temp = doc.search("p.weather-quickie span").text




  end

end
