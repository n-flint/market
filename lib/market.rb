require './lib/vendor'

class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors = []
    @vendors.each do |vendor|
      if vendor.inventory.has_key?(item)
      vendors << vendor
      end
    end
    vendors
  end

  def sorted_item_list
    list = []
    @vendors.each do |vendor|
      list << vendor.inventory.keys
    end
    list.flatten.uniq.sort
  end

  #tried to reuse my sorted item list, but i dont think i want my keys in my inventory hash to be in alphabetical order, according to the interaction pattern
  # def total_inventory
  #   inventory = Hash.new
  #   sorted_item_list.each do |item|
  #     inventory[item] = 0
  #   end
  #   inventory
  # end

  def total_inventory
    inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        inventory[item] += vendor.inventory[item]
      end
    end
    inventory
  end

  #This method only partly works. It is able to return true or false deplending on if the item is in stock. And it is able to change the stock of the vendor. If the vendor does not have enough of that stock tho, I was unable to figure out how to move to the next vendor, and subtract the difference from their stock. Spent a while on this, and could not figure out what I was doing wrong.
  def sell(item, quantity)
    if total_inventory.has_key?(item) && quantity < total_inventory[item]
      @vendors.each do |vendor|
        if vendor.inventory.has_key?(item)
          if vendor.inventory[item] >= quantity
            vendor.inventory[item] -= quantity
          else
            vendor.inventory[item] -= quantity
            diff = vendor.inventory[item].abs
            vendor.inventory[item] = 0
            @vendors.each do |vendor|
              if vendor.inventory.has_key?(item)
                if vendor.inventory[item] != 0
                  require "pry"
                  binding.pry
                  vendor.inventory[item] - diff
                end
              end
            end
          end
        end
      end
        return true
      else
        return false
    end
  end
end
