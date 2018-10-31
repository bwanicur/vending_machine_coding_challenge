require_relative '../vending_machine'
require_relative './support/products_data'

RSpec.describe VendingMachine do
  let(:vending_machine) { VendingMachine.new(ProductsData::DATA) }

  describe '#start_purchase' do
    it 'should set a value for the purchase_amount' do
      vending_machine.start_purchase(100)
      expect(vending_machine).to be
    end
  end

  describe '#complete_purchase' do
    it 'should immediately end the purchase process if there are insufficient funds' do
      vending_machine.start_purchase(1)
      expect(vending_machine.complete_purchase('CHIPS')).to eq('Insufficient Funds!')
    end

    it 'should return a product purchase object with proper change' do
      vending_machine.start_purchase(500)
      purchase_result = vending_machine.complete_purchase('SODA')
      expect(purchase_result.product.code).to eq('SODA')
      expect(purchase_result.change).to eq('$4.00')
    end
  end

  describe '#cancel' do
    it 'should return a product purchase object with a full refund of change' do
      vending_machine.start_purchase(100)
      purchase_result = vending_machine.cancel
      expect(purchase_result.change).to eq('$1.00')
    end
  end

  describe '#get_quantity' do
    it 'should return the quantity for product, given a code' do
      expect(vending_machine.get_quantity('CHIPS')).to eq(10)
    end
  end

  describe '#get_cost' do
    it 'should return the cost for product, given a code' do
      expect(vending_machine.get_cost('CHIPS')).to eq(150)
    end
  end
end
