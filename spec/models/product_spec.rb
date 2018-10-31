require_relative '../../models/product'

RSpec.describe Product do

    describe '#initialize' do
      it 'should raise a ProductError exception if code or cost has no value' do
        expect { Product.new({ code: 'foobar', cost: nil }) }.to raise_error(ProductError)
        expect { Product.new({ code: nil, cost: 100 }) }.to raise_error(ProductError)
        expect { Product.new({ code: 'foobar', cost: 100 }) }.not_to raise_error
      end
    end
    
    describe '#decrement_quantity' do
      let(:product) { Product.new(code: 'abc', cost: 100, quantity: 10) }
      
      it 'should decrement the quantity by 1' do
        product.decrement_quantity!
        expect(product.quantity).to eq(9)
      end
      
      it 'should reset the quantity to a given or default value once it reaches 0' do
        product.quantity = 0
        product.decrement_quantity!
        expect(product.quantity).to eq(Product::DEFAULT_QUANTITY)
      end
    end

end
