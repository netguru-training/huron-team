class BarsController < ApplicationController
  before_action :set_gon_vars

  expose(:bars)
  expose(:bar, attributes: :bar_params)


  before_filter :redirect_if_not_owner

  def create
    if BarCreateWithGeolocation.new(bar,current_user).call!
      redirect_to bar, notice: "Bar has been created"
    else
      render :new
    end
  end

  def update
    if BarCreateWithGeolocation.new(bar,current_user).call!
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
    p = params.require(:bar).permit(:name, :lat, :lng) 
    beers_ids = params[:bar][:beer_ids].select { |x| x.present? }

    p.deep_merge({ 'beer_ids' => beers_ids })
  end

  def redirect_if_not_owner
    redirect_to root_path unless current_user.has_role? :bar_owner
  end
end
