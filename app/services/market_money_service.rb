require 'faraday'
class MarketMoneyService
  def markets
    get_url("/api/v0/markets")
  end

  def market(id)
    get_url("/api/v0/markets/#{id}")
  end

  def vendors(id)
    get_url("http://localhost:3000/api/v0/markets/#{id}/vendors")
  end

  def conn
    @conn ||= Faraday.new(url: "http://localhost:3000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end