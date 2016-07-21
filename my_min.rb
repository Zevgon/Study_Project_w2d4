def my_min1(list)
  list.each do |el|
    smallest = true
    list.each do |el2|
      smallest = false if el2 < el
    end
    return el if smallest
  end
end


def my_min2(list)
  smallest = list.first
  list.each do |el|
    smallest = el if el < smallest
  end

  smallest
end

def largest_sub_sum1(list)
  sub_lists = []
  (0...list.length).each do |idx|
    (idx...list.length).each do |idx2|
      sub_lists << list[idx..idx2]
    end
  end
  sums = sub_lists.map { |el| el.reduce(:+) }.max
end

def largest_sub_sum2(list)
  running_total = 0
  current_max = list.first
  list.each do |el|
    if running_total + el < 1
      current_max = running_total if running_total > current_max
      running_total = 0
    else
      running_total += el
      current_max = running_total if running_total > current_max
    end
  end
  current_max
end

p largest_sub_sum2([2, 3, -6, 3, -6, -5])
