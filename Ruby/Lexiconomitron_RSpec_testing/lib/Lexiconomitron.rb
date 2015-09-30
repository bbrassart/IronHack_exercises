class Lexiconomitron

	def remove_t(array)
		array.each do |word|
			word.gsub!(/[tT]/, "")
		end
	end

	def shazam(array)
		remove_t(array)
		array.each do |word|
			word.reverse!
		end
		result_shazam = []
		result_shazam.push array[0]
		result_shazam.push array[array.count - 1]
		result_shazam
	end

	def oompa_loompa(array)
		remove_t(array)
		result_oompa = []
		array.each do |word|
			if word.length <= 3
				result_oompa.push word
			end
		end
		result_oompa
	end

	def all_in_line(array, string)
		remove_t(array)
		array.sort! do |a,b|
			b.length <=> a.length
		end
		array * string
	end

	def supercounter(array)
		remove_t(array)
		result_super = 0
		final_super_str = array.join("")
		final_str = final_super_str.split("")
		final_str.each do |letter|
			if letter.to_s.ord < 116
				result_super += 1
			end
		end
		result_super
	end
end
