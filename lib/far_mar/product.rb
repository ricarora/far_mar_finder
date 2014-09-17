module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(id, name, vendor_id)
      @id = id.to_i
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


      Vendor.all.find_all {|vendor| vendor.id == @vendor_id}

    end

    def sales
      # returns a collection of FarMar::Sale instances that are associated
      # with market using the FarMar::Sale
      market = Market.find(@vendor_id)
      list_of_vendors = market.vendors
      list_of_vendors.collect {|each_vendor| (Sale.all.find_all {|vendor| sale.vendor_id == each_vendor.id})}

    end

    def number_of_sales
      # returns the number of times this product has been sold
      Sale.all.find_all {|sale| sale.product_id == @id}

    end

    def self.by_vendor(vendor_id)
      # returns all of the products with the given vendor_id

      Product.all.find_all {|product| product.vendor_id == vendor_id}

    end

  end
end
