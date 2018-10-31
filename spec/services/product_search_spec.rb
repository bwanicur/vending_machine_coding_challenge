require_relative '../../services/product_search'
require_relative '../support/products_data'

RSpec.describe ProductSearch do
  describe 'self.fetch' do
    let(:products) do
      [
        Product.new(code: 'CHIPS', cost: 100),
        Product.new(code: 'JUICE', cost: 500),
      ]
    end

    it 'should fetch a product given a collection of products and a code' do
      res = ProductSearch.fetch('CHIPS', products)
      expect(res.code).to eq('CHIPS')
    end

    it 'should raise an exception if it cannot find the product by code' do
      expect { ProductSearch.fetch('DOESNOTEXIST', products) }.to raise_error(ProductSearchError)
    end
  end
end
