require "spec_helper"

describe Spree::OrderVersion do
  let!(:order) { FactoryGirl.create(:order) }

  it "creates a version when an order is updated" do
    expect {
      order.update(email: 'test@test.com')
    }.to change {
      Spree::OrderVersion.count
    }.from(1).to(2)
  end

  context "with paper trail turned off" do
    before { Spree::Order.paper_trail_off! }
    after { Spree::Order.paper_trail_on! }

    it "does not create a version when an order is updated" do
      expect {
        order.update(email: 'test@test.com')
      }.to_not change { Spree::OrderVersion.count }
    end
  end
end
