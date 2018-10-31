require_relative '../../services/change_calculator'

RSpec.describe ChangeCalculator do
  describe 'self.run' do
    it 'should raise an exception if the amount is not greater than 0' do
      expect { ChangeCalculator.run(0) }.to raise_error(ChangeCalculatorError)
    end

    it 'should raise an exception if the cost is greater than the amount' do
      expect { ChangeCalculator.run(50, 100) }.to raise_error(ChangeCalculatorError)
    end
    
    it 'should calculate the change from a purchase' do
      expect(ChangeCalculator.run(100, 50)).to eq(50)
    end
  end
end
