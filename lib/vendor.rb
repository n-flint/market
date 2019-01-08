class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.has_key?(item)
      stock = @inventory[item]
    else
      stock = 0
    end
  end

  def stock(item, quantity)
      @inventory[item] += quantity
  end



end
