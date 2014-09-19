module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize(id, name, address, city, county, state, zip)
      @id = id.to_i
      @name = name
      @address = address
      @city = city
      @county = county
      @state = state
      @zip = zip
    end

    def self.all
      # returns all rows of the CSV file as objects
      CSV.read("support/markets.csv").collect { |row| Market.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Market.all.find { |market| (market.id || "") == id }
    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.
      Vendor.all.select { |vendor| vendor.market_id == @id }
    end

    def products
      # returns a collection of FarMar::Product instances that are associated to
      # the market through the FarMar::Vendor class.
      Product.all.select { |vendor|vendor.market == @market_id }
    end

    def self.search(search_term)
      # returns a collection of FarMar::Market instances where the market name or
      # vendor name contain the search_term. For example FarMar::Market.search('school')
      # would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
      Market.all.select { |market| market.name == search_term || market.vendors.name == search_term }
    end

    def prefered_vendor
      # returns the vendor with the highest revenue
      vendors.max_by { |vendor| vendor.revenue }
    end

    def prefered_vendor(date)
      # returns the vendor with the highest revenue for the given date
      vendors.max_by { |vendor| vendor.revenue(date) }
    end

    def worst_vendor
      # returns the vendor with the lowest revenue
      vendors.min_by { |vendor| vendor.revenue }
    end

    def worst_vendor(date)
      # returns the vendor with the lowest revenue on the given date
      vendors.min_by { |vendor| vendor.revenue(date) }
    end

    def self.find_by_x(match)
      # where X is an attribute, returns a single instance whose X attribute
      # case-insensitive attribute matches the match parameter. For instance,
      # FarMar::Vendor.find_by_name("windler inc") could find a FarMar::Vendor
      # with the name attribute "windler inc" or "Windler Inc".
      

    end

    def self.find_all_by_x(match)
      # works just like `find_by_x` but returns a collection containing all
      # possible matches. For example `FarMar::Market.find_by_state("WA")` could
      # return all of the FarMar::Market object with `"WA"` in their state field.

    end
  end
end
