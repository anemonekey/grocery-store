require "csv"

module Grocery
  class Customer
    attr_reader :customer, :email, :address, :customers
    @@customers = []
    def initialize(customer, email, address)
      @customer = customer
      @email = email
      @address = address
    end
    def self.all
      if @@customers.length == 0
        CSV.open("support/customers.csv", 'r').each do |line|
          customer = line[0].to_i
          email = line[1]
          address = {}
          address[:street] = line[2]
          address[:city] = line[3]
          address[:state] = line[4]
          address[:zipcode] = line[5]
          new_customer = Customer.new(customer, email, address)
          @@customers << new_customer
        end
        return @@customers
      else
        return @@customers
      end
    end
    def self.find(id)
      Customer.all
      if id >= 1 && id <= 35
        return @@customers[id-1]
      else
        return false
      end
    end
  end
end
