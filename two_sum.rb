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

def four_sum?(arr, target)
  hash = Hash.new{ |h, k| h[k] = 4
  arr.each do |el|
    hash[target - el] -= 1
    hash[el] = 1

  end
end

[2, 5, 4, 3], 14




arr = [0, 1, 8, 5, 7]
p best_two_sum?(arr, 6) # => should be true
p best_two_sum?(arr, 10)
