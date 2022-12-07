module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    my_each { |item| new_array << item if yield(item) }
    new_array
  end

  def my_all?
    result = true
    my_each { |item| result = false unless yield(item) }
    result
  end

  def my_any?
    result = false
    my_each { |item| result = true if yield(item) }
    result
  end

  def my_none?
    result = true
    my_each { |item| result = false if yield(item)}
    result
  end

  def my_count
    if block_given?
      count = 0
      my_each { |item| count += 1 if yield(item) }
      count
    else
      self.length
    end
  end

  def my_map
    new_array = []
    my_each { |item| new_array << yield(item)}
    new_array
  end

  def my_inject(initial_value)
    total = initial_value
    my_each do |item|
      total = yield(total, item)
    end
    total
  end
end

# You will first have to define my_each on the Array class. Methods defined in
# your enumerable module will have access to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end

# below was used to test my methods
initial_value = 0
enumerable = [1, 1, 2, 3, 5, 8, 13, 21, 34]
# p enumerable.my_select { |item| item > 10 }
p enumerable.my_inject(initial_value) { |total, item| total + item }