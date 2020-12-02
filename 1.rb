# 1.rb
# Author: natleyn
# Version: 0.0.1
# Solves the first problem for the Advent of Code 2020 challenge.

require_relative './1_data.rb'

module Aoc1

	def self.run_program(num_array, target_num)
		total = -1
		sorted_data = num_array.sort
		end_index = sorted_data.length - 1
		while end_index >= 0 && sorted_data[end_index] > target_num 
			end_index = end_index - 1
		end
		sorted_data.each_index do |index|
			#print "Comparing index #{index}, num #{sorted_data[index]}, with:\n"
			while end_index >= 0 && sorted_data[index] + sorted_data[end_index] > target_num
				#print "... end_index #{end_index}, num #{sorted_data[end_index]}. Sum: #{sorted_data[index] + sorted_data[end_index]}\n"
				end_index = end_index - 1
			end
			if ((sorted_data[index] + sorted_data[end_index]) == target_num)
				print "Solution found: indices #{index} and #{end_index}, nums #{sorted_data[index]} and #{sorted_data[end_index]}, summing to #{sorted_data[index] + sorted_data[end_index]}\n"
				total = sorted_data[index] * sorted_data[end_index]
				return total
			end
		end
		total
	end 	

	def self.run_aoc1
		run_program(@@number_array, 2020)	
	end

	def self.run_aoc2
		@@number_array.each do |num|
			#print "Searching for triple number solution, using number: #{num}\n"
			triple_total = run_program(@@number_array, 2020-num)
			if triple_total != -1
				print "Solution is the two numbers printed past \"Solution found:\" and #{num}\n"
				return triple_total
			end
		end
		print "Triple solution not found.\n"
		triple_total
	end
end

print "#{Aoc1::run_aoc2}\n"
