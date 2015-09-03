class FizzBuzz
	def initialize
		@numbers = (1..100).to_a
	end
	def play(solution_hash ,my_lambda)
		newnumbers = @numbers.map do |number|
			result = my_lambda.call(solution_hash,number)
		end
		puts newnumbers
	end
end

my_lambda = -> (solution_hash, number) do
	result = ""
	solution_hash.each do |key,value|
		if number%key == 0
			result += solution_hash[key]
		end
	end
	if result != ''
		return result
	else
		return number
	end
end

solution_hash = {
  3 => "Fizz",
	5 => "Buzz",
	15 => "Blue"
}

fizzbuzz = FizzBuzz.new
fizzbuzz.play(solution_hash, my_lambda)
