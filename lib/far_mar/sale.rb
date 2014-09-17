module FarMar
  class Sale
    attr_accessor :id, :amount_in_cents, :purchase_time, :vendor_id, :product_id

    def initialize(id, amount_in_cents, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount_in_cents = amount_in_cents.to_i
      @purchase_time = purchase_time
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i

    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/sales.csv").collect {|row| Sale.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Sale.new *CSV.read("support/sales.csv").find {|row| (row[0].to_i || "") == id }
    end

    def vendor
      # returns the FarMar::Vendor instance that is associated with this sale
      # using the FarMar::Sale vendor_id field

      Vendor.all.find_all {|vendor| vendor.id == @vendor_id}
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
