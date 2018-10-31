require_relative './change_presenter'

class PurchaseResult
  attr_reader :product, :change
  def initialize(atts = {})
    @product = atts[:product]
    @change = ChangePresenter.new(atts[:change]).amount
  end
end
