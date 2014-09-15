module FarMar
  class Market

    def self.all
      # returns all rows of the CSV file as objects
      support/market.csv
    end

    def self.find(id)
      # returns the row where the ID field matches the argument

    end

    def vendors
      # returns a collection of FarMar::Vendor instances that are associated
      # with the market by the market_id field.

    end

  end
end
