class ChangeCalculatorError < StandardError
end

class ChangeCalculator
  def self.run(amount, cost = 0)
    unless amount > 0
      raise ChangeCalculatorError.new('Amount must be an integer greater than 0')
    end
    if cost > amount
      raise ChangeCalculatorError.new('The amount must be greater than the cost')
    end
    amount - cost
  end
end
