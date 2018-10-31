require_relative '../services/product_restocker'

class ProductError < StandardError
end

class Product
  DEFAULT_QUANTITY = 10

  attr_reader :code, :cost
  attr_accessor :quantity

  def initialize(atts = {})
    @code = atts[:code]
    @cost = atts[:cost]
    raise ProductError.new('Invalid Product: Code and Cost are required') unless valid?
    ProductRestocker.run(self, atts[:quantity])
  end

  def decrement_quantity!
    res = quantity - 1
    res > 0 ? self.quantity = res : ProductRestocker.run(self)
  end

  private

  def valid?
    !@code.nil? && !@cost.nil?
  end
end
