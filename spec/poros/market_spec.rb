require 'rails_helper'
RSpec.describe Market do
  describe "instantiation" do
    before do
      @data = {
        "id": "322458",
        "type": "market",
        "attributes": {
            "name": "14&U Farmers' Market",
            "street": "1400 U Street NW ",
            "city": "Washington",
            "county": "District of Columbia",
            "state": "District of Columbia",
            "zip": "20009",
            "lat": "38.9169984",
            "lon": "-77.0320505",
            "vendor_count": 1
        }
      }
    end

    it "has attributes" do
      market = Market.new(@data)

      expect(market).to be_a(Market)
      expect(market.id).to eq("322458")
      expect(market.name).to eq("14&U Farmers' Market")
      expect(market.address).to eq("1400 U Street NW ")
      expect(market.city).to eq("Washington")
      expect(market.state).to eq("District of Columbia")
    end
  end
end