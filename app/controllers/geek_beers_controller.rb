class GeekBeersController < ApplicationController
  before_action :set_gon_vars
  expose_decorated(:bars) { working_bars }
  expose(:bar)
  expose(:cities_names) { fetch_cities_names }

  def index

  end

  private

  def working_bars
    @working_bars ||= Bar.working_bars
  end

  def fetch_cities
    working_bars.map(&:city).select { |x| x.present? }.uniq
  end


end
