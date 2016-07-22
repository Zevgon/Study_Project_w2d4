require 'byebug'

def bad_two_sum?(arr, target)
  (0...arr.length - 1).each do |idx|
    (idx+1...arr.length).each do |idx2|
      return true if arr[idx] + arr[idx2] == target
    end
  end

  false
end

def bsearch?(arr, target)
  return false if arr.length == 0
  split = arr.length / 2
  left = arr[0...split]
  right = arr[split+1...arr.length]
  if target == arr[split]
    return true
  elsif target < arr[split]
    return bsearch?(left, target)
  else
    return bsearch?(right, target)
  end
end

def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el, idx|
    test_arr = arr[0...idx] + arr[idx+1...arr.length]
    result = bsearch?(test_arr, target - el)
    return true if result
  end
  false
end

def best_two_sum?(arr, target)
  h = Hash.new { |h, k| h[k] = false }
  arr.each do |el|
    return true if h[target - el]
    h[el] = true
  end

  false
end

def four_sum_bad?(arr, target)
  (0...arr.length - 3).each do |idx1|
    (idx1 + 1...arr.length - 2).each do |idx2|
      (idx2 + 1...arr.length - 1).each do |idx3|
        (idx3 + 1...arr.length).each do |idx4|
          return true if arr[idx1] + arr[idx2] + arr[idx3] + arr[idx4] == target
        end
      end
    end
  end

  false
end

def four_sum_okay?(arr, target)
  first_hash = Hash.new { |h, k| h[k] = [] }

  (0...arr.length - 1).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      first_hash[arr[idx1] + arr[idx2]] << [idx1, idx2]
    end
  end


  sums_hash = Hash.new { |h, k| h[k] = false }
  first_hash.keys.each do |el|
    first_hash[el].any? do |arr1|
      first_hash[target - el].each do |arr2|
        return true if (arr1 + arr2).uniq.length == 4
      end
    end
    return true if sums_hash[target - el]
    sums_hash[el] = true
  end
  false

end

# [2, 5, 4, 3], 14


p four_sum_okay?([1, 4, 7, 5, 32, 7, 9, 187], 50)

arr = [0, 1, 8, 5, 7]
# p best_two_sum?(arr, 6) # => should be true
# p best_two_sum?(arr, 10)
