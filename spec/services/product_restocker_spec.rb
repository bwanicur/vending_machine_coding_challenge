require_relative '../../services/product_restocker'
require_relative '../../models/product'
require 'ostruct'

RSpec.describe ProductRestocker do

  describe 'self.run' do
    let(:product) { OpenStruct.new(code: 'abc', cost: 100, quantity: 0) }
    
    it 'should set the quantity of a product to a given value' do
      ProductRestocker.run(product, 50)
      expect(product.quantity).to eq(50)
    end

    it 'should set the quantity of a product to a default value' do
      ProductRestocker.run(product, nil)
      expect(product.quantity).to eq(Product::DEFAULT_QUANTITY)
    end
  end

end
