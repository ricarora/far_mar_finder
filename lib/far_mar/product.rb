module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id - id.to_i
      @name = name
      @vendor_id = vendor_id.to_i
    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/products.csv").collect {|row| Product.new *row }


    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Product.new *CSV.read("support/products.csv").find {|row| (row[0].to_i || "") == id }
    end

    def vendor
      # returns the FarMar::Vendor instance that is associated with this vendor
      # using the FarMar::Product vendor_id field

    end

    def sales
      # returns a collection of FarMar::Sale instances that are associated
      # with market using the FarMar::Sale

    end

    def number_of_sales
      # returns the number of times this product has been sold

    end

    def self.by_vendor(vendor_id)
      # returns all of the products with the given vendor_id

    end

  end
end
