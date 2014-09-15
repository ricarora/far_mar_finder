module FarMar
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
end
