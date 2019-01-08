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



end
