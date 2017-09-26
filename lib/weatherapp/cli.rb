class Weatherapp::CLI #CLI Controller

def call

  puts "Today's Weather:"
  show_weather

end

def show_weather
  puts "The weather is sunny with a temperature of 98 degrees in Sarasota, FL"
end

end
