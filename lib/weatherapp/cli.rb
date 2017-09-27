class Weatherapp::CLI #CLI Controller

attr_accessor :state_weather

def call
  greeting
  list_states
  goodbye
end

def greeting

  puts "***********************************************"
  puts "       WELCOME TO THE WEATHER APP!"
  puts "***********************************************"

end

  def list_states
  states = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming" ]
  puts "Please type the state that you'd like to see the weather for."
  puts "If you would like to see the list of states again please type states. Otherwise type exit to quit."
   state = nil
   while state != "exit"
     state = gets.strip.downcase
     if states.include?(state)
       @state_weather = Weatherapp::Weather.new(state)
       @state_weather.city_list
       list_cities
     elsif state == "states"
       states.each.with_index(1) do |s, i|
         puts "#{i}. #{s.capitalize}"
       end
       puts "Please type the state name that you would like to see the weather for."
     elsif state != "states" && state != "exit" && states.include?(state) == false
         puts "I don't know what you mean, please type states to see a list of states or exit."
       end
 end
end

  def list_cities
    puts "You have chosen #{@state_weather.state}."
    puts "These are the available weather stations in your selected state."
      @state_weather.cities.each.with_index(1) do |c, i|
        "puts #{i}. #{c.name}"
      end
    end


  def goodbye
      puts "See you tomorrow!"
  end

end
