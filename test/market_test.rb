require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/market'

class MarketTest < MiniTest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")

    assert_instance_of Market, market
  end

  def test_it_has_a_name
    market = Market.new("South Pearl Street Farmers Market")

    expected = "South Pearl Street Farmers Market"
    assert_equal expected, market.name
  end

  def test_it_starts_with_empty_array_of_vendors
    market = Market.new("South Pearl Street Farmers Market")

    assert_equal [], market.vendors
  end

  def test_it_can_add_vendors
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)

    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)

    expected = [vendor_1, vendor_2, vendor_3]
    assert_equal expected, market.vendors
  end

  def test_it_can_return_array_of_vendor_names
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)

    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    assert_equal expected, market.vendor_names
  end

  def test_it_can_find_vendors_who_sell_an_item
    market = Market.new("South Pearl Street Farmers Market")
    vendor_1 = Vendor.new("Rocky Mountain Fresh")
    vendor_1.stock("Peaches", 35)
    vendor_1.stock("Tomatoes", 7)
    vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    vendor_2.stock("Banana Nice Cream", 50)
    vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    vendor_3 = Vendor.new("Palisade Peach Shack")
    vendor_3.stock("Peaches", 65)
    market.add_vendor(vendor_1)
    market.add_vendor(vendor_2)
    market.add_vendor(vendor_3)

    expected = [vendor_1, vendor_3]
    assert_equal expected, market.vendors_that_sell("Peaches")
    assert_equal [vendor_2], market.vendors_that_sell("Banana Nice Cream")
  end

  # def test_it_has_a_list_of_all_items_sorted_alphabetically
  #   market = Market.new("South Pearl Street Farmers Market")
  #   vendor_1 = Vendor.new("Rocky Mountain Fresh")
  #   vendor_1.stock("Peaches", 35)
  #   vendor_1.stock("Tomatoes", 7)
  #   vendor_2 = Vendor.new("Ba-Nom-a-Nom")
  #   vendor_2.stock("Banana Nice Cream", 50)
  #   vendor_2.stock("Peach-Raspberry Nice Cream", 25)
  #   vendor_3 = Vendor.new("Palisade Peach Shack")
  #   vendor_3.stock("Peaches", 65)
  #   market.add_vendor(vendor_1)
  #   market.add_vendor(vendor_2)
  #   market.add_vendor(vendor_3)
  #
  #   expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]
  #
  #
  # end




end
