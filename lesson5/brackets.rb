def valid_brackets?(str)
  brackets_map = { ')' => '(', ']' => '[', '}' => '{', '>' => '<' }
  opening_brackets = [], closing_brackets = []
  brackets_map.each do |closing_bracket, opening_bracket|
    opening_brackets << opening_bracket
    closing_brackets << closing_bracket
  end

  stack = []
  str.each_char do |bracket|
    if opening_brackets.include?(bracket)
      stack << bracket
    elsif closing_brackets.include?(bracket)
      return false if stack.empty? || brackets_map[bracket] != stack.last

      stack.pop
    end
  end
  stack.empty?
end

puts valid_brackets?('({<[()]>})') #=> true
puts valid_brackets?('({<[(<)>]>})') #=> false
puts valid_brackets?(')(') #=> false
