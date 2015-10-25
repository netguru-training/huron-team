require 'rails_helper'

RSpec.describe BarDecorator do
  describe "#street_and_city" do
    let(:bar) { build(:bar, city: "Warsaw", street: 'heheszek street').decorate }

    it "returns street and city" do
      expect(bar.street_and_city).to eq("heheszek street Warsaw")  
    end
  end
end
