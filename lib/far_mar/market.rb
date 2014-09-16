module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip
    attr_accessor :vendors

    def initialize (id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip

    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/markets.csv").collect {|row| Market.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Market.new *CSV.read("support/markets.csv").find {|row| (row[0].to_i || "") == id }
    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.


    end

  end
end
