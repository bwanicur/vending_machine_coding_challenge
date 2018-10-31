require_relative '../models/product'
# NOTE: Trivial class with the assumption that restocking will become more complex
class ProductRestocker
  def self.run(product, quantity = nil)
    product.quantity = quantity || Product::DEFAULT_QUANTITY
  end
end
