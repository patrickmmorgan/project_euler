# The sequence of triangle numbers is generated by adding the natural numbers. 
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
# The first ten terms would be: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?

require 'pry'
require 'prime'

def factorsOf(number)
  primes, powers = number.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  
  val = divisors.sort.map{|div| [div, number / div]}

  return val.flatten.sort.uniq.length
end

def calcNum(starting_point)
	nums = [starting_point]
	factors = 0
	val = starting_point

	until factors > 500
		nums << nums[-1] + (nums.length + 1)
		val = nums[-1]
		factors = factorsOf(val)
	end

	return val
end

timer_start = Time.now
answer = calcNum(1)
puts answer
puts "Completed in: #{(Time.now - timer_start)*1000} milliseconds"