module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id

    def initialize(id, name, number_of_employees, market_id)
      @id = id.to_i
      @name = name
      @no_of_employees = number_of_employees.to_i
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
      # Vendor.new *CSV.read("support/vendors.csv").find {|row| (row[0].to_i || "") == id }
      Vendor.all.find {|vendor| (vendor.id || "") == id }
    end

    def market
      # returns the FarMar::Market instance that is associated with this vendor
      # using the FarMar::Vendor market_id field
      Market.find(@market_id)
    end

    def products
      # returns a collection of FarMar::Product instances that are associated
      # with market by the FarMar::Product vendor_id field
      # market = Market.find(@id)
	    # all_vendors = market.vendors
	    # all_vendors.collect {|each_vendor| Product.all.find_all {|product| product.vendor_id == each_vendors.id }}
      Product.all.find_all {|product| product.vendor_id == @id }
    end

    def sales
      # returns a collection of FarMar::Sale instances that are associated with
      # market by the vendor_id field
      Sale.all.find_all {|sale| sale.vendor_id == @id}
    end

    def revenue
      # returns the the sum of all of the vendor's sales (in cents)
      # sales.inject(0) {|sum, sale| sum + sale.amount }
      # (1..3).inject(0) {}
      # sales.collect {|sale| sale.amount}.reduce(0) {|sum, amt| sum+amt}
      # sales.map(&:amount).reduce(:+)
      sales.inject(0) {|sum, sale| sum + sale.amount }
    end

    def self.by_market(market_id)
      # returns all of the vendors with the given market_id
      market = Market.find(market_id)
	    market.vendors
    end

    def self.most_revenue(n)
      # returns the top n vendor instances ranked by total revenue
      Vendor.all.sort_by {|vendor| vendor.revenue }.reverse.first(n)
    end

    def self.most_items(n)
      # returns the top n vendor instances ranked by total number of items sold
      Vendor.all.sort_by {|vendor| vendor.products.count }.reverse.first(n)
    end

    def self.revenue(date)
      # returns the total revenue for that date across all vendors
      #Vendor.all.inject(0) {|sum, vendor| sum + vendor.revenue if vendor.sales.purchase_date == Date.parse(date)}
      Vendor.all.select {|vendor| vendor.sales.purchase_date == Date.parse(date) }.inject(0) {|sum, vendor| sum + vendor.revenue }
    end

    def revenue(date)
      # returns the total revenue for that specific purchase date and vendor instance
      #vendor.sales.inject(0) {|sum, vendor| sum + vendor.revenue if vendor.purchase_date == Date.parse(date)}
      vendor.sales.select {|vendor| vendor.purchase_date == Date.parse(date) }.inject(0) {|sum, vendor| sum + vendor.revenue }
    end

  end
end
