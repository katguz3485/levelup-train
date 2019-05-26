require_relative 'price'

class Converter
  class InvalidCurrency < StandardError; end

  attr_reader :price

  EXCHANGE_RATIO = {eur: {pln: 4.32, usd: 1.13, eur: 1},
                    usd: {pln: 3.81, eur: 0.88, usd: 1},
                    pln: {eur: 0.23, usd: 0.26, pln: 1}
  }

  def initialize(price)
    @price = price
  end

  def convert_to(new_currency_name)
    validate_currency(new_currency_name)
    current_currency_name = price.currency
    amount = price.amount
    final = EXCHANGE_RATIO.dig(current_currency_name, new_currency_name) * amount
    final.round(2)
  end


  def validate_currency(new_currency_name)
    raise InvalidCurrency unless EXCHANGE_RATIO.key?(new_currency_name)
  end

end

price_in_euro = Price.new(10, :eur)
puts  converter = Converter.new(price_in_euro)
puts converter.convert_to(:usd) # => 11.3
puts converter.convert_to(:eur) # => 10
puts converter.convert_to(:pln) # => 43.2
converter.convert_to(:xxx) # => raises error
