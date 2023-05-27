require 'rails_helper'
RSpec.describe "markets#show" do
  describe "display" do
    it "shows market name, address, and list of vendors", :vcr do
      markets = MarketsFacade.new.get_markets
      market = MarketsFacade.new(markets[50].id.to_i).market

      visit market_path(market.id)

      expect(page).to have_content("Hiawatha Thriftway farmers market")
      expect(page).to have_content("719 NORTH FIRST STREET")
      expect(page).to have_content("Hiawatha")
      expect(page).to have_content("Kansas")
      expect(page).to have_content("66434")
    end

    it "each vendor's name is a link to vendor show page", :vcr do
      markets = MarketsFacade.new.get_markets
      market = MarketsFacade.new(markets[50].id).market
      visit market_path(market.id)

      within("#vendors") do
        expect(page).to have_content("Jamin Good Time")
        expect(page).to have_content("Oceanic Artifacts")
        expect(page).to have_content("Crested Butte Cakes")
        expect(page).to have_content("The Kelp Kraze")
        expect(page).to have_content("The Vegan Ice Cream Shop")
        expect(page).to have_content("Roots & Fruits")
        expect(page).to have_content("Thrive and Grow")
        expect(page).to have_content("Splatter House")
        expect(page).to have_content("Handmade Pottery Co.")
        expect(page).to have_content("The Gin Joint")
        expect(page).to have_content("The Egg-cellent Company")
      end
    end
  end
end