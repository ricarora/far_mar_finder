module FarMar
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
