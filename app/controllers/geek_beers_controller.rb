class GeekBeersController < ApplicationController
  before_action :set_gon_vars
  expose_decorated(:bars) { Bar.working_bars }
  expose(:bar)
end
