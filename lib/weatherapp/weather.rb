class Weatherapp::Weather

  attr_accessor :name, :cities, :state, :url

  def initialize(state)
    @state = state
  end

  def city_weather
    html = open("https://www.wunderground.com/cgi-bin/findweather/getForecast?query=#{@state}")
    weather_list = Nokogiri::HTML(html)
    all_cities = []
    weather_list.css("tbody tr").each do |w|
       city = w.css("a").text
       url = w.css("a").attr("href").value
       all_cities << "#{city} : #{url}"
    end
    @cities = all_cities
  end


end
