class MarketsFacade
  def initialize(id = nil)
    @id = id
  end

  def get_markets
    @_markets ||= service.markets[:data].map do |market_info|
      Market.new(market_info)
    end
  end

  def market
    Market.new(service.market(@id)[:data])
  end

  def vendors
    @_vendors ||= service.vendors(@id)[:data].map do |vendor_info|
      Vendor.new(vendor_info)
    end
  end

  private
    def service
      @_service ||= MarketMoneyService.new
    end
end