def max_window_range_bad(arr, window)
  current_max_range = nil
  arr.each_index do |idx|
    temp = arr[idx...idx + window]
    temp_diff = temp.max - temp.min
    current_max_range ||= temp_diff
    current_max_range = temp_diff if temp_diff > current_max_range
  end

  current_max_range
end



class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.unshift(el)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack

  def initialize
    @store = []
    @maxes = []
    @mins = []
  end

  def pop
    if peek == max
      @maxes.pop
    end
    if peek == min
      @mins.pop
    end
    @store.pop

  end

  def push(el)
    @store.push(el)
    @maxes << el if @maxes.empty? || el >= max
    @mins << el if @mins.empty? || el <= min
    @store.last
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @maxes.last
  end

  def min
    @mins.last
  end

end

class StaQueue

  def initialize
    @stack = MyStack.new
  end

  def enqueue(el)
    new_stack = MyStack.new
    until @stack.empty?
      new_stack.push(@stack.pop)
    end
    @stack.push(el)
    until new_stack.empty?
      @stack.push(new_stack.pop)
    end
    @stack
  end

  def dequeue
    # new_stack = MyStack.new
    # until @stack.empty?
    #   new_stack.push(@stack.pop)
    # end
    # return_value = new_stack.pop
    #
    # until new_stack.empty?
    #   @stack.push(new_stack.pop)
    # end
    #
    # return_value
    @stack.pop
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end

end

class MinMaxStackQueue < StaQueue

  def max
    @stack.max
  end

  def min
    @stack.min
  end

end

def max_window_range(arr, window)
  queue = MinMaxStackQueue.new
  max_range = 0
  arr.each_with_index do |el, idx|
    if window > idx
      queue.enqueue(el)
    else
      curr_range = queue.max - queue.min
      max_range = curr_range if curr_range > max_range
      queue.dequeue
      queue.enqueue(el)
    end
  end
  curr_range = queue.max - queue.min
  max_range = curr_range if curr_range > max_range
  max_range
end

  p max_window_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p max_window_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p max_window_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p max_window_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
