class Vendor
  attr_reader :id,
              :name,
              :contact_name,
              :phone,
              :credit,
              :description

  def initialize(data)
    @id = data[:id].to_i
    @name = data[:attributes][:name]
    @contact_name = data[:attributes][:contact_name]
    @phone = data[:attributes][:contact_phone]
    @credit = yesno(data[:attributes][:credit_accepted])
    @description = data[:attributes][:description]
  end

  def yesno(bool)
    if bool
      "YES"
    else
      "NO"
    end
  end
end