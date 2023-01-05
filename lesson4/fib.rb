# Задача:
# Заполнить массив числами фибоначчи до 100

fib_nums = [0, 1]
cur_idx = 1
limit = 100

while fib_nums[cur_idx] < limit
  next_num = fib_nums[cur_idx] + fib_nums[cur_idx - 1]
  next_num > limit ? break : fib_nums << next_num

  cur_idx += 1
end

