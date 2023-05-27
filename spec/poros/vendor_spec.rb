require 'rails_helper'
RSpec.describe Vendor do
  describe "instantiation" do
    it "has attributes" do
      data = {
        "id": "55217",
        "type": "vendor",
        "attributes": {
            "name": "The Kelp Kraze",
            "description": "Kelp-based snacks, salads, and other products",
            "contact_name": "Gov. Carry Erdman",
            "contact_phone": "(295) 946-7881",
            "credit_accepted": true,
            "states_sold_in": [
                "Kansas"
            ]
        }
    }

      vendor = Vendor.new(data)
      expect(vendor).to be_a(Vendor)
      expect(vendor.id).to eq(55217)
      expect(vendor.name).to eq("The Kelp Kraze")
      expect(vendor.contact_name).to eq("Gov. Carry Erdman")
      expect(vendor.phone).to eq("(295) 946-7881")
      expect(vendor.credit).to eq("YES")
      expect(vendor.description).to eq("Kelp-based snacks, salads, and other products")
    end
  end

  describe "instance methods" do
    it "#yesno" do
      data = {
        "id": "55217",
        "type": "vendor",
        "attributes": {
            "name": "The Kelp Kraze",
            "description": "Kelp-based snacks, salads, and other products",
            "contact_name": "Gov. Carry Erdman",
            "contact_phone": "(295) 946-7881",
            "credit_accepted": true,
            "states_sold_in": [
                "Kansas"
            ]
        }
    }

      vendor = Vendor.new(data)
      expect(vendor.yesno(true)).to eq("YES")
      expect(vendor.yesno(false)).to eq("NO")
    end
  end
end