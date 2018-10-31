require_relative '../../presenters/change_presenter'

RSpec.describe ChangePresenter do
  describe '#amount' do
    it 'should format the amount in pennies as an easily readable currency value' do
      expect(ChangePresenter.new(100).amount).to eq('$1.00')
    end
  end
end
