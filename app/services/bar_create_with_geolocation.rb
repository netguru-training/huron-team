class BarCreateWithGeolocation  
  attr_accessor :lat, :lng, :bar
  def initialize(bar)
  	self.bar = bar
  	self.lat = bar.lat
  	self.lng = bar.lng
  end

  def call!
  	assign_geolocation_info
  	bar.save
  end

  private 

  def geocoder
  	@geocoder ||= GoogleMapsGeocoder.new("#{lat}, #{lng}")
  end

  def assign_geolocation_info
  	bar.city = geocoder.city
    bar.street = geocoder.formatted_address.split(", ").first
  end
end
