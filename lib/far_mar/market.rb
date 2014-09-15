module FarMar
  class Market
    attr_reader :id, :market_name, :address, :city, :county, :state, :zip_code

    def initialize (id, market_name, address, city, county, state, zip_code)
      @id = id
      @market_name = market_name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip_code = zip_code
    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/markets.csv").collect {|row| Market.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      CSV.read("support/markets.csv").collect {|row| }
    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.

    end

  end
end
