class Market
  attr_reader :id,
              :name,
              :address,
              :city,
              :state,
              :zip
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @address = data[:attributes][:street]
    @city = data[:attributes][:city].gsub("  ", " ") if data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zip]
  end
end