# Создать свой аналог класса Array, String, Hash (на выбор).
class CustomHash

  def initialize(this = {})
    @this = this
  end

  def [](key)
    @this[key]
  end

  def []=(key, value)
    @this[key] = value
  end

  def custom_each(&block)
    @this.each(&block)
  end

  def to_array
    arr_to_return = []
    @this.each do |key, value|
      arr_to_return << [key, value]
    end
    arr_to_return
  end
end


hash = CustomHash.new({
                        apple:    3,
                        cucumber: 5,
                        computer: 1_500,
                        book:     15
                      })

hash['soda'] = 1

hash.to_array.to_s #=> [[:apple, 3], [:cucumber, 5], [:computer, 1500], [:book, 15], ["soda", 1]]

hash.custom_each do |key, value|
  if value <= 15
    puts "#{key} is affordable."
  else
    puts "#{key} it's a rip off!!!"
  end
end
#=> apple is affordable.
# cucumber is affordable.
# computer it's a rip off!!!
# book is affordable.
# soda is affordable.
