module FarMar
  class Sale
    attr_accessor :id, :transaction, :time, :market_id, :vendor_id

    def initialize
      @id = id
      @transaction = transaction
      @time = time
      @market_id = market_id
      @vendor_id = vendor_id

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
