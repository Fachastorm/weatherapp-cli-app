class Weatherapp::CLI #CLI Controller

def call

  puts "Today's Weather:"
  list_states
  menu
  goodbye
end

def list_states
  puts "1. Alabama 2. New york ... etc"
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
