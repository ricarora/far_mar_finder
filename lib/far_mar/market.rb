module FarMar
  class Market
    attr_reader :id, :market_name, :address, :city, :county, :state, :zip_code

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/markets.csv").collect {|market| market = Market.new}
    end

    def self.find(id)
      # returns the row where the ID field matches the argument

    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.

    end

  end
end
