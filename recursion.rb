require 'byebug'

def sum_to(num)
    return 0 if num == 0
    return nil if num < 0
    sum_to(num-1) + num
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil

def add_numbers(nums_arr)
    return nil if nums_arr.empty?
    return nums_arr.first if nums_arr.length == 1
    add_numbers(nums_arr[0..-2]) + nums_arr.last
end

# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(num)
    return nil if num == 0
    return 1 if num == 1
    (num - 1) * gamma_fnc(num - 1)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    # debugger
    if flavors.last == favorite
        # debugger
        return true
    else
        flavors.pop
        # debugger
        ice_cream_shop(flavors, favorite)
        # debugger
    end
end

# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return "" if string.length == 0
    reverse = string[0]
    reverse(string[1..-1]) + reverse
end

p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""





def range(start_num, end_num)
    return [] if end_num < start_num
    prev_range = range(start_num, end_num - 1)
    prev_range.concat([end_num])
end

#Recursive
def sum(array)
    return 0 if array.empty?

    sum_before_last = sum(array[0..-2])
    sum_before_last + array.pop
end

# #Iterative
def sum(array)
    return nil if array.empty?
    array.inject { |sum, num| sum + num }
end

# # Version 1
def exponentiation(base, power)
    return 1 if power == 0
    prev_result = exponentiation(base, power - 1)
    prev_result * base
end

# # Version 2
def exponentiation(base, power)
    return 1 if power == 0
    return base if power == 1

    if power.even?
        exponentiation(base, power / 2) * exponentiation(base, power / 2)
    else
        base * exponentiation(base, (power-1) / 2) * exponentiation(base, (power-1) / 2)
    end
end

# p exponentiation(0, 0)
# p exponentiation(0, 1)
# p exponentiation(1, 0)
# p exponentiation(1, 1)
# p exponentiation(1, 2)
# p exponentiation(2, 0)
# p exponentiation(2, 1)
# p exponentiation(2, 2)

def deep_dup(array)
    return [] if array.length == 0
    result = []
    array.each do |el|
        if el.is_a?(Array)
            result << deep_dup(el)
        else
            result << el
        end
    end

    result
end

# p a = [1, [2], [3, [4]]]
# p b = deep_dup(a)

# b[1] << "Hello"
# p b
# p a

def fibonacci(n)
    return [0] if n == 1
    return [0,1] if n == 2

    prev_fibs = fibonacci(n - 1)
    next_fib = prev_fibs[-2] + prev_fibs[-1]
    prev_fibs.concat([next_fib])
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(5)
# p fibonacci(10)

def bsearch(array, target)
    return nil if array.empty?
    if array.length == 1 && target == array.first
        return 0 
    else
        nil
    end

    mid = array.length / 2
    if array[mid] == target
        return mid
    elsif target < array[mid]
        left = array.take(mid)
        bsearch(left, target)
    elsif
        right = array.drop(mid + 1)
        sub_answer = bsearch(right, target)
        sub_answer.nil? ? nil : mid + 1 + sub_answer
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# p bsearch([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], 20)

def merge_sort(array, &prc)
    return array if array.length <= 1
    prc ||= Proc.new { |x,y| x <=> y }

    mid = array.length / 2
    sorted_left = merge_sort(array.take(mid), &prc)
    sorted_right = merge_sort(array.drop(mid), &prc)

    merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)
    result = []
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            result << left.shift
        when 0
            result << right.shift
        when 1
            result << right.shift
        end
    end

    result + left + right
end

# p merge_sort([1,4,2,5,7,8,4,2])
# p merge_sort([1,2,6,7,4,2,6,8,9]) { |x,y| y <=> x }

def subsets(array)
    return [[]] if array.empty?
    prev_subset = subsets(array.take(array.count - 1))
    prev_subset.concat(prev_subset.map { |arr| arr + [array.last] })
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

