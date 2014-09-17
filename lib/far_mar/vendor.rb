module FarMar
  class Vendor
    attr_accessor :id, :name, :number_of_employees, :market_id

    def initialize(id, name, number_of_employees, market_id)
      @id = id.to_i
      @name = name
      @number_of_employees = number_of_employees
      @market_id = market_id.to_i
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
      Market.find(@market_id)
    end

    def products
      # returns a collection of FarMar::Product instances that are associated
      # with market by the FarMar::Product vendor_id field
      market = Market.find(@id)
	    all_vendors = market.vendors
	    all_vendors.collect {|each_vendor| Product.all.find_all {|product| product.vendor_id == each_vendors.id }}

    end

    def sales
      # returns a collection of FarMar::Sale instances that are associated with
      # market by the vendor_id field
      Sale.all.find_all {|sale| sale.vendor_id == @id}

    end

    def revenue
      # returns the the sum of all of the vendor's sales (in cents)
      sum = 0
      Sale.all.find {|sale| sum+=sale.amount if sale.vendor_id == @id_.to_f}
    end

    def self.by_market(market_id)
      # returns all of the products with the given vendor_id

    end

  end
end
