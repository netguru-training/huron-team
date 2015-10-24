class BarsController < ApplicationController
  expose(:bars)
	expose(:bar, attributes: :bar_params)

	def create
		if bar.save!
			redirect_to bar_path
		else
			render 'new'
		end
	end

	private

	def bar_params
		params.require(:bar).permit(:name, :lat, :lng)
	end
end
