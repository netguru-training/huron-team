class GeekBeersController < ApplicationController
  before_action :set_gon_vars
  expose_decorated(:bars) { get_bars }
  expose(:bar)
  expose(:cities_names) { fetch_cities }

  private

  def working_bars
    @working_bars ||= Bar.working_bars
  end

  def fetch_cities
    working_bars.map(&:city).select { |x| x.present? }.uniq
  end

  private

  def get_bars
    params[:search_city] ? working_bars.bars_in_city(params[:search_city]) : working_bars
  end
end
