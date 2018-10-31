require_relative '../models/product'
# NOTE: For the purposes of this coding challenge, I will assume the data intake format
#       will be a simple Hash.  Of course, this is not "production ready", but I am chosing
#       to "punt" on the question of importing data and how one might handle that in production.
class ProductsImporter
  def self.run(products = [])
    products.map { |hash| Product.new(code: hash[:code], cost: hash[:cost]) }
  end
end
