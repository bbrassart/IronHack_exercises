require_relative 'lib/Converter.rb'

puts Converter.convert(1, 'eur', 'usd')
puts Converter.convert(1, 'usd', 'eur')
puts Converter.convert(35, 'cad', 'eur')
puts Converter.convert(10, 'usd', 'eur')
puts Converter.from_other_to_other(50, 'usd', 'cad')
