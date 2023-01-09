
nums = [1, 0, -200, 1.2, -44.5, 2, 6, 50, 50, 1, 0, -200, -250, 1000, 100_000_000]

def sort(arr, direction = 'asc')
  return arr if arr.empty? || arr.size == 1

  sorted_arr = [] + arr
  pointer_1 = 0
  while pointer_1 < sorted_arr.size
    pointer_2 = pointer_1
    min_num = sorted_arr[pointer_1]
    min_idx = pointer_1
    while pointer_2 < sorted_arr.size
      if min_num > sorted_arr[pointer_2]
        min_num = sorted_arr[pointer_2]
        min_idx = pointer_2
      end
      pointer_2 += 1
    end
    temp = sorted_arr[pointer_1]
    sorted_arr[pointer_1] = min_num
    sorted_arr[min_idx] = temp
    pointer_1 += 1
  end
  direction == 'desc' ? sorted_arr.reverse : sorted_arr
end

puts sort(nums).to_s #=> [-250, -200, -200, -44.5, 0, 0, 1, 1, 1.2, 2, 6, 50, 50, 1000, 100000000]
puts sort(nums, 'desc').to_s #=> [100000000, 1000, 50, 50, 6, 2, 1.2, 1, 1, 0, 0, -44.5, -200, -200, -250]
