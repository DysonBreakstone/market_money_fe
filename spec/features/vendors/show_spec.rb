require 'rails_helper'
RSpec.describe "vendors#show" do
  describe "display" do
    it "shows vendor name, contact info, credit_accepted, and description", :vcr do
      visit vendor_path(54958)

      expect(page).to have_content("The Vegan Ice Cream Shop")
      expect(page).to have_content("Description: This vendor sells vegan ice cream in a variety of flavors.")
      expect(page).to have_content("Contact Name: Keren Stroman")
      expect(page).to have_content("Phone: 551.131.1824")
      expect(page).to have_content("Credit Accepted? NO")

      visit vendor_path(55537)

      expect(page).to have_content("Thrive and Grow")
      expect(page).to have_content("Description: Organic seeds and seedlings")
      expect(page).to have_content("Contact Name: Sen. Malika Fisher")
      expect(page).to have_content("Phone: 1-696-673-1247")
      expect(page).to have_content("Credit Accepted? YES")
    end
  end
end