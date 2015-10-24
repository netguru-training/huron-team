class BarsController < ApplicationController
  before_filter :set_gon_vars
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

	def bar_params
		params.require(:bar).permit(:name, :lat, :lng)
	end

  def set_gon_vars
    gon.bar = bar.persisted? ? bar : nil
  end
end
