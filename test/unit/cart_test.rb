require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :products
  
  def setup
	@cart = Cart.new
	@rails = products(:rails_book)
	@ruby = products(:ruby_book)
  end

  test "add unique products" do
	cart = Cart.new
	rails_book = products(:rails_book)
	ruby_book = products(:ruby_book)
	cart.add_product rails_book
	cart.add_product ruby_book
	assert_equal 2, cart.items.size
	assert_equal rails_book.price + ruby_book.price, cart.total_price
  end

  test "add duplicate product" do
	car = Cart.new
	rails_book = products(:rails_book)
	cart.add_product rails_book
	cart.add_product rails_book
	assert_equal 2*rails_book.price, cart.total_price
	assert_equal 1, cart.items.size
	assert_equal 2, cart.items[0].quantity
  end

end
