class GeekBeersController < ApplicationController
  expose(:bars)
  expose(:bar)
  expose(:beers) { bar.beers }
end
