# Задача:
# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = %w[a b c d e f g h i j k k m n o p q r s t u v w x y z].freeze
vowels = %w[a e i o u]
vowels_hash = {}

alphabet.each_with_index do |letter, position|
  vowels_hash[letter] = position + 1 if vowels.include?(letter)
end
