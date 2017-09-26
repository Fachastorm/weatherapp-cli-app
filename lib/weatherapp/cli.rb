class Weatherapp::CLI #CLI Controller

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
  all_states = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming" ]
  puts "Please type the state that you'd like to see the weather for."
  puts "If you would like to see the list of states again please type states. Otherwise type exit to quit."
   state = nil
   while state != "exit"
     state = gets.strip.downcase
     if state == "states"
       all_states.each.with_index(1) do |s, i|
         puts "#{i}. #{s.capitalize}"
       end
   end
 end
end


  def goodbye
      puts "See you tomorrow!"
  end

end
