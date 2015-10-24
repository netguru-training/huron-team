class BarsController < ApplicationController
  # before_action :set_gon_vars
  expose(:bars) { Bar.working_bars }
  expose(:bar, attributes: :bar_params)
  expose(:beers) { bars.beers }

  def create
    if BarCreateWithGeolocation.new(bar).call!
      redirect_to bar, notice: "Bar has been created"
    else
      render :new
    end
  end

  def update
    if BarCreateWithGeolocation.new(bar).call!
      redirect_to bar, notice: "Bar has been updated"
    else
      render :edit
    end
  end

  private

  def set_gon_vars
    gon.bar = bar.persisted? ? bar : nil
  end

	def bar_params
		params.require(:bar).permit(:name, :lat, :lng, beer_ids: []) 
	end
end
