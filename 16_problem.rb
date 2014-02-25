# -----------------------
# Power digit sum
# Problem 16
# -----------------------

# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 2^1000?

# -----------------------

# Thoughts --> A super straightforward problem here

num = 2**1000

ary = num.to_s.split("").map {|x| x.to_i}

answer = ary.reduce(:+)