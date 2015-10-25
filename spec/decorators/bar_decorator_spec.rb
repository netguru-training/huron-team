require 'rails_helper'

RSpec.describe BarDecorator do
  describe "#street_and_city" do
    let(:bar) { build(:bar, city: "Warsaw", street: 'heheszek street').decorate }

    it "returns street and city" do
      expect(bar.street_and_city).to eq("heheszek street Warsaw")  
    end
  end
  
  describe "#name with count" do
    let!(:bar) { create(:bar, name: "Adam").decorate }

    before do 
      3.times do
        bar.beers << create(:beer)
      end
    end

    it "returns name with count" do
      expect(bar.name_with_count).to eq("Adam (3)")  
    end
  end
end
