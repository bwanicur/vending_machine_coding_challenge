require 'rubygems'
require 'money'
class ChangePresenter
  I18n.enforce_available_locales = false # for Money gem
  
  def initialize(amount_in_pennies)
    @amount = amount_in_pennies
  end

  def amount
    Money.new(@amount, 'USD').format
  end
end
