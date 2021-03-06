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
      CSV.read("support/products.csv").map { |row| Product.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      # Product.new *CSV.read("support/products.csv").find {|row| (row[0].to_i || "") == id }
      Product.all.find { |product| (product.id || "") == id }
    end

    def vendor
      # returns the FarMar::Vendor instance that is associated with this vendor
      # using the FarMar::Product vendor_id field
      # Vendor.all.find {|vendor| vendor.id == @vendor_id}
      Vendor.find(@vendor_id)
    end

    def sales
      # returns a collection of `FarMar::Sale` instances that are associated
      # with market using the `FarMar::Sale` `product_id` field
      # market = Market.find(@vendor_id)
      # list_of_vendors = market.vendors
      # list_of_vendors.each {|each_vendor| (Sale.all.find_all {|sale| sale.product_id == @id})}
      Sale.all.select { |sale| sale.product_id == @id }
    end

    def number_of_sales
      # returns the number of times this product has been sold
      Sale.all.find_all { |sale| sale.product_id == @id }
    end

    def self.by_vendor(vendor_id)
      # returns all of the products with the given vendor_id
      Product.all.select { |product| product.vendor_id == vendor_id }
    end

    def self.most_revenue(n)
      # returns the top n products instances ranked by total revenue
      Product.all.sort_by { |product| product.number_of_sales }.reverse.first(n)
    end

    def self.find_by(search_what, match)
      # where X is an attribute, returns a single instance whose X attribute
      # case-insensitive attribute matches the match parameter. For instance,
      # FarMar::Vendor.find_by_name("windler inc") could find a FarMar::Vendor
      # with the name attribute "windler inc" or "Windler Inc".
      Product.all.find { |product| product.send(search_what.to_sym).casecmp(match) == 0 }
    end

    def self.find_all_by(search_what, match)
      # works just like `find_by_x` but returns a collection containing all
      # possible matches. For example `FarMar::Market.find_by_state("WA")` could
      # return all of the FarMar::Market object with `"WA"` in their state field.
      Product.all.select { |product| product.send(search_what.to_sym).casecmp(match) == 0 }
    end
  end
end
