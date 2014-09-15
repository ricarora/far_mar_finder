module FarMar
  class Market
    def self.all
      # returns all rows of the CSV file as objects

    end

    def self.find(id)
      # returns the row where the ID field matches the argument

    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.

    end

  end

  class Vendor

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

  class Product

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

  class Sale
    def vendor
      # returns the FarMar::Vendor instance that is associated with this sale
      # using the FarMar::Sale vendor_id field

    end

    def product
      # returns the FarMar::Product instance that is associated with this sale
      # using the FarMar::Sale product_id field

    end

    def self.between(beginning_time, end_time)
      # returns a collection of FarMar::Sale objects where the purchase time is
      # between the two times given as arguments

    end
  end
end
