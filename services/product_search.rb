require_relative '../models/product'

class ProductSearchError < StandardError
end

class ProductSearch
  def self.fetch(code, products)
    product = products.select{ |product| product.code == code }.first
    product || ( raise ProductSearchError.new('Product does not exist') )
  end
end
