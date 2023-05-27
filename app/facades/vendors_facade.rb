class VendorsFacade
  def initialize(id = nil)
    @id = id
  end

  def vendor
    Vendor.new(service.vendor(@id)[:data])   
  end

  private
    def service
      @_service ||= MarketMoneyService.new
    end
end