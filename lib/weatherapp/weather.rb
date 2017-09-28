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

  def citys_weather(input)
    @cities.each.with_index(1) do |c, i|

      cit = c.split(/ : /)
      receiver_city = cit[0].downcase
      if receiver_city == input
        html = open("https://www.wunderground.com/#{cit[1]}")
        doc = Nokogiri::HTML(html)
          temperature = doc.search("span.test-true span.wu-value.wu-value-to").first.text
          conditions =  doc.search("div.condition-icon.small-6 p").text
          wind = doc.search("div.condition-wind p strong").first.text
          speed = doc.search("div.wind-speed strong").text
          tomorrow_temp = doc.search("p.weather-quickie span").text


          puts "**********************************************************************************"
          puts "The current temperature is #{temperature} degrees fahrenheit in #{receiver_city}."
          puts "The current conditions in #{receiver_city} are: #{conditions}."
          puts "The wind is currently out of the #{wind} at #{speed} MPH."
          puts "Tomorrow is forecast to be #{tomorrow_temp} temperature as today."
          puts "That is all for your weather for today."
          puts "**********************************************************************************"
          puts "Type cities to see a list of cities or type the name of the city. You can also type states to see the list of states again. If you are done, please type exit"
      end
    end
  end
end
