module FarMar
  class Sale
    attr_accessor :id, :amount, :purchase_time, :purchase_date, :vendor_id, :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = Time.parse(purchase_time)
      @purchase_date = Date.parse(purchase_time)
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i
    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/sales.csv").collect { |row| Sale.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      # Sale.new *CSV.read("support/sales.csv").find {|row| (row[0].to_i || "") == id }
      Sale.all.find { |sale| (sale.id || '') == id }
    end

    def vendor
      # returns the FarMar::Vendor instance that is associated with this sale
      # using the FarMar::Sale vendor_id field
      Vendor.find(@vendor_id)
    end

    def product
      # returns the FarMar::Product instance that is associated with this sale
      # using the FarMar::Sale product_id field
      Product.find(@product_id)
    end

    def self.between(beginning_time, end_time)
      # returns a collection of FarMar::Sale objects where the purchase time is
      # between the two times given as arguments
      Sale.all.find_all { |sale| Time.parse(beginning_time) < sale.purchase_time  < Time.parse(end_time) }
    end

    def self.find_by(search_what, match)
      # where X is an attribute, returns a single instance whose X attribute
      # case-insensitive attribute matches the match parameter. For instance,
      # FarMar::Vendor.find_by_name("windler inc") could find a FarMar::Vendor
      # with the name attribute "windler inc" or "Windler Inc".
      Sale.all.find { |sale| sale.send(search_what.to_sym).casecmp(match) == 0 }
    end

    def self.find_all_by(search_what, match)
      # works just like `find_by_x` but returns a collection containing all
      # possible matches. For example `FarMar::Market.find_by_state("WA")` could
      # return all of the FarMar::Market object with `"WA"` in their state field.
      Sale.all.select { |sale| sale.send(search_what.to_sym).casecmp(match) == 0 }
    end
  end
end
