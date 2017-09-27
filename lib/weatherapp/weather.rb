require "pry"

class Weatherapp::Weather

  attr_accessor :cities, :state, :url

  def initialize(state)
    @state = state
  end

  def city_list
    html = open("https://www.wunderground.com/cgi-bin/findweather/getForecast?query=#{@state}")
    weather_list = Nokogiri::HTML(html)
    @cities = []
    weather_list.css("tbody tr").each do |w|
       city.name = w.css("a").text
       city.url = w.css("a").attr("href").value
      @cities << "#{city.name} : #{city.url}"
    end
    @cities
  end

end
