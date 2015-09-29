require_relative 'lib/Lexiconomitron.rb'

array = ["This", "is", "a", "boring", "test"]
my_instance = Lexiconomitron.new()
puts my_instance.shazam(array)


array = ["if", "you", "wanna", "be", "my", "lover"]
puts my_instance.oompa_loompa(array)

array = ['words', 'are', 'tremendously', 'nice']
puts my_instance.all_in_line(array, '$')

array = ['I', 'am', 'getting', 'tired', 'of', 'your', 'words']
puts my_instance.supercounter(array)
