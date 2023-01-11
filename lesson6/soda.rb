# Instances of the class can be initialized with an addition.
# An instance uses the show_my_drink method to log
class Soda

  def initialize(additive = '')
    @additive = additive
  end

  def show_my_drink
    @additive.empty? ? 'Обычная газировка' : "Газировка и #{@additive}"
  end
end

soda_with_lemon = Soda.new('лимон')
puts soda_with_lemon.show_my_drink #=> Газировка и лимон
plain_soda = Soda.new
puts plain_soda.show_my_drink #=> Обычная газировка
