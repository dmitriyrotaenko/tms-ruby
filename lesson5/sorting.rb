
nums = [1, 0, -200, 1.2, -44.5, 2, 6, 50, 50, 1, 0, -200, -250, 1000, 100_000_000]

def sort(arr, direction = 'asc')
  return arr if arr.empty? || arr.size == 1

  sorted_arr = arr.dup
  0.upto(sorted_arr.size - 1) do |idx|
    min_num = sorted_arr[idx]
    min_idx = idx
    idx.upto(sorted_arr.size - 1) do |idx2|
      if min_num > sorted_arr[idx2]
        min_num = sorted_arr[idx2]
        min_idx = idx2
      end
    end
    temp = sorted_arr[idx]
    sorted_arr[idx] = min_num
    sorted_arr[min_idx] = temp
  end
  direction == 'desc' ? sorted_arr.reverse : sorted_arr
end

puts sort(nums).to_s #=> [-250, -200, -200, -44.5, 0, 0, 1, 1, 1.2, 2, 6, 50, 50, 1000, 100000000]
puts sort(nums, 'desc').to_s #=> [100000000, 1000, 50, 50, 6, 2, 1.2, 1, 1, 0, 0, -44.5, -200, -200, -250]
