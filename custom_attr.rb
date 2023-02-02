
module CustomAttrReader
  def my_custom_attr_reader(*attrs)
    attrs.each do |attr|
      define_method(attr) do
        self.attr
      end
    end
    puts "Аттрибуты #{attrs}"
  end
end

class A
  extend CustomAttrReader

  my_custom_attr_reader :a

  def initialize(a, b)
    @a = a
    @b = b
  end
end





test = A.new(1, 2)

puts test.a
