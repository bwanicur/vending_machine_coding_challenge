require_relative './services/products_importer'
require_relative './services/product_search'
require_relative './services/change_calculator'
require_relative './presenters/purchase_result'

class VendingMachine
  def initialize(products)
    reset_purchase_amount!
    @products = ProductsImporter.run(products)
  end

  def start_purchase(amount)
    @purchase_amount = amount
  end

  def complete_purchase(code)
    product = ProductSearch.fetch(code, @products)
    return 'Insufficient Funds!' if insufficient_funds?(product.cost)
    change = ChangeCalculator.run(@purchase_amount, product.cost)
    product.decrement_quantity!
    reset_purchase_amount!
    PurchaseResult.new(product: product, change: change)
  end

  def cancel
    change = ChangeCalculator.run(@purchase_amount, 0)
    reset_purchase_amount!
    PurchaseResult.new(product: nil, change: change)
  end
  
  def get_quantity(code)
    ProductSearch.fetch(code, @products)&.quantity
  end
  
  def get_cost(code)
    ProductSearch.fetch(code, @products)&.cost
  end

  private

  def reset_purchase_amount!
    @purchase_amount = 0
  end

  def insufficient_funds?(cost)
    cost > @purchase_amount
  end
end
