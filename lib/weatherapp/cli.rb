class Weatherapp::CLI #CLI Controller

attr_accessor :state_weather

  def call
    greeting
    list_states
    goodbye
  end

  def greeting

    puts "***********************************************"
    puts "       WELCOME TO YOUR WEATHER APP!"
    puts "***********************************************"

  end

  def states
    states = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming" ]
  end

  def list_states
    puts "Please type the state that you'd like to see the weather for."
    puts "Otherwise type 'exit' to quit the program."
     input = nil
     while input != "exit"
       input = gets.strip.downcase
       if states.include?(input)
         @state_weather = Weatherapp::Weather.new(input)
         @state_weather.city_list
         list_cities
         puts "Please type the state name that you would like to see the weather for."
       elsif input != "exit" && states.include?(input) == false
           puts "I don't know what you mean, please type the name of the state or 'exit'."
      else goodbye
    end
   end
  end

  def list_cities
    @state_weather.cities.each.with_index(1) do |c, i|
    city = c.split(/ : /)
    puts "#{i}. #{city[0]}"
   end
   city_weather
  end

  def city_weather
    puts "You have chosen #{@state_weather.state.capitalize}."
    puts "These are the available weather stations in your selected state."
    puts "Type the city whose weather you'd like to see"
    input = nil
      available = []
      @state_weather.cities.each.with_index(1) do |c, i|
      city = c.split(/ : /)
     available << city[0].downcase
    end

   while input != "exit"
     input = gets.strip.downcase
     if input == "cities"
      @state_weather.cities.each.with_index(1) do |c, i|
        city = c.split(/ : /)
        puts "#{i}. #{city[0]}"
      end
      elsif available.include?(input)
       @state_weather.citys_weather(input)
        elsif input != "exit"
          puts "Type 'cities' to see a list of cities or type the 'name' of the city. If you are done, please type 'exit'"
    else
      goodbye
    end
  end
end


  def goodbye
    abort("See you tomorrow!")
  end

end
