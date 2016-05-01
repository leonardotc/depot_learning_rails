require 'test_helper'

class CartTest < ActiveSupport::TestCase
  setup do
    @cart = carts(:one)
  end

  it "should should stack products" do

    2.times do
      @product = products :ruby
      @cart.add_product(@product)
    end

    assert @cart.line_items.length == 1

    @product = products :ruby
    ruby_item = @cart.line_items.pop
    assert ruby_item.total_price == 2 * product.price

  end

end
