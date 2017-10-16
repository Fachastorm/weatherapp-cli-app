class Weatherapp::City

attr_accessor :name, :url, :temperature, :wind, :conditions, :speed, :tomorrow_temp

def initialize(name, url)
  @name = name
  @url = url
end



end
