class BarCreateWithGeolocation  
  
  attr_accessor :lat, :lng, :bar, :user
  def initialize(bar,user)
  	self.bar = bar
    self.user = user
  	self.lat = bar.lat
  	self.lng = bar.lng
  end

  def call!
    assign_to_user
  	assign_geolocation_info
  	bar.save
  end

  private 

  def geocoder
  	@geocoder ||= GoogleMapsGeocoder.new("#{lat}, #{lng}")
  end

  def assign_to_user
    bar.user_id = user
  end

  def assign_geolocation_info
  	bar.city = geocoder.city
    bar.street = geocoder.formatted_address.split(", ").first
  end
end
