module FarMar
  class Market
    attr_reader :id, :name, :address, :city, :county, :state, :zip

    def initialize (id, name, address, city, county, state, zip)
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
      CSV.read("support/markets.csv").collect {|row| Market.new *row }
    end

    def self.find(id)
      # returns the row where the ID field matches the argument
      # find method is finding one row for the matching id
      # then passed to market.new to convert as object
      Market.new *CSV.read("support/markets.csv").find {|row| (row[0].to_i || "") == id }
    end

    def vendors

      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.

      Vendor.all.find_all {|vendor| vendor.market_id == @id}
    end

    def products
      # returns a collection of FarMar::Product instances that are associated to
      # the market through the FarMar::Vendor class.

    end

    def self.search(search_term)
      # returns a collection of FarMar::Market instances where the market name or
      # vendor name contain the search_term. For example FarMar::Market.search('school')
      # would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).

    end

    def prefered_vendor
      # returns the vendor with the highest revenue

    end

    def prefered_vendor(date)
      # returns the vendor with the highest revenue for the given date

    end

    def worst_vendor
      # returns the vendor with the lowest revenue

    end

    def worst_vendor(date)
      # returns the vendor with the lowest revenue on the given date
      
    end

  end
end
