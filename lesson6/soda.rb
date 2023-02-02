# Создать класс Soda (для определения типа газировки), принимающий 1 аргумент при инициализации
# (отвечающий за добавку к выбираемому лимонаду). В этом классе реализуйте метод show my drink(),
# выводящий на печать «Газировка и {ДОБАВКА}» в случае наличия добавки, а иначе отобразится следующая фраза:
# «Обычная газировка».

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
