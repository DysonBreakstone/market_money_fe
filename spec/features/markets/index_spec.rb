require 'rails_helper'
RSpec.describe "markets#index" do
  describe "display" do

    it "shows the name, city, and state of markets", :vcr do
      @markets = MarketsFacade.new.get_markets
      visit "/markets"

      @markets.each do |market|
        within("##{market.id}") do
          expect(page).to have_content(market.name)
          expect(page).to have_content(market.city)
          expect(page).to have_content(market.state)
          expect(page).to have_button("More Info")
        end
        visit "/markets"
      end
      
    end
    
    it "has buttons for each market leading to that market's show page", :vcr do
      @markets = MarketsFacade.new.get_markets
      visit "/markets"
        for i in 0..50
          within ("##{@markets[i].id}") do
            click_on "More Info"
            expect(current_path).to eq(market_path(@markets[i].id))
          end
          visit "/markets"
        end
    end
  end
end