class GeekBeersController < ApplicationController
  expose(:bars) { Bar.working_bars }
  expose(:bar)
end
