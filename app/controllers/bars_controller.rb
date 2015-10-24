class BarsController < ApplicationController
  before_action :set_gon_vars
  before_action :set_bar_address, only: [:create, :update]
  expose(:bars)
  expose(:bar, attributes: :bar_params)
  
  def create
    if bar.save
      redirect_to bars_path(bar), notice: "Bar has been created"
    else
      render :new
    end
  end

  def update
    if bar.save
      redirect_to bars_path(bar), notice: "Bar has been updated"
    else
      render :edit
    end
  end

  private

  def set_gon_vars
    gon.bar = bar.persisted? ? bar : nil
  end

  def set_bar_address
    coords = bar.lat.to_s + ", " + bar.lng.to_s
    geocoder = GoogleMapsGeocoder.new(coords)
    bar.city = geocoder.city
    bar.street = geocoder.formatted_address.split(", ").first
  end

	def bar_params
		params.require(:bar).permit(:name, :lat, :lng)
	end
end
