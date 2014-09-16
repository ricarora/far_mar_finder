module FarMar
  class Vendor


    attr_accessor :id, :name, :product, :market_id

    def initialize
      @id = id
      @name = name
      @product = product
      @market_id = market_id
    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/vendors.csv").collect {|row| Vendor.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Vendor.new *CSV.read("support/vendors.csv").find {|row| (row[0].to_i || "") == id }
    end

    def market
      # returns the FarMar::Market instance that is associated with this vendor
      # using the FarMar::Vendor market_id field

    end

    def products
      # returns a collection of FarMar::Product instances that are associated
      # with market by the FarMar::Product vendor_id field

    end

    def sales
      # returns a collection of FarMar::Sale instances that are associated with
      # market by the vendor_id field

    end

    def revenue
      # returns the the sum of all of the vendor's sales (in cents)

    end

    def self.by_market(market_id)
      # returns all of the products with the given vendor_id

    end

  end
end
