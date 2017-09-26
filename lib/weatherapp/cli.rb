class Weatherapp::CLI #CLI Controller

def call
  greeting
  list_states
  menu
  goodbye
end

def greeting

  puts "***********************************************"
  puts "       WELCOME TO THE WEATHER APP!"
  puts "***********************************************"

end

def list_states
  all_states = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming" ]
  puts "Please type the state that you'd like to see the weather for."
  puts "If you would like to see the list of states again please type states. Otherwise type exit to quit."
   state = nil
   while state != "exit"
     state = gets.strip.downcase
   end

end

def menu
  "Please choose the state or type states to see the states again:"
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    case input
      when "1"
       puts "weather for city 1"
      when "2"
       puts "weather for city 2"
     when "states"
       list_states
     else
       puts "Not sure what you want, type states or exit"
     end

  end
end

  def goodbye
      puts "See you tomorrow!"
  end

end
