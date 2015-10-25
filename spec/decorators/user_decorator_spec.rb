require 'rails_helper'

RSpec.describe UserDecorator do
  describe "#name_or_name" do
    let(:user) { build(:user, name: 'bruce_wayne', email: 'bruce@wayne.co').decorate }

    context "name is not empty" do
      it "return human-readable name" do
        expect(user.name_or_mail).to eq('Bruce Wayne')
      end
    end

    context "name is empty" do
      before { allow(user).to receive(:name).and_return(nil) }
      it "returns email" do
        expect(user.name_or_mail).to eq('bruce@wayne.co')
      end
    end
  end
end
