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
end
