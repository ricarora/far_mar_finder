module FarMar
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
end