def max_window_range_bad(arr, window)
  a = Time.new
  current_max_range = nil
  arr.each_index do |idx|
    temp = arr[idx...idx + window]
    temp_diff = temp.max - temp.min
    current_max_range ||= temp_diff
    current_max_range = temp_diff if temp_diff > current_max_range
  end
  b = Time.new
  p b - a
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
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    if @stack2.empty?
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end
    @stack2.pop
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
    if @stack1.max.nil?
      @stack2.max
    elsif @stack2.max.nil?
      @stack1.max
    else
      @stack2.max > @stack1.max ? @stack2.max : @stack1.max
    end
  end

  def min
    if @stack1.min.nil?
      @stack2.min
    elsif @stack2.min.nil?
      @stack1.min
    else
      @stack2.min < @stack1.min ? @stack2.min : @stack1.min
    end
  end

end

def max_window_range(arr, window)
  a = Time.now
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
  b = Time.now
  p b - a
  max_range
end



test_arr = (0...100000).to_a.shuffle
max_window_range(test_arr, 100)
max_window_range_bad(test_arr, 100)
