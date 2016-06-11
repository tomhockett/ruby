def caesar_cipher(string, shift)

	shiftyArray = string.chars.map(&:ord)

	shiftedArray = shiftyArray.map do |n|
		next 32 if n == 32

		if n.between?(65, 90)
			if (n + shift.to_i) > 90
				(n + shift.to_i) - 26
			else
				n + shift.to_i
			end
			
		elsif n.between?(97, 122)
			if (n + shift.to_i) > 122
				(n + shift.to_i) - 26
			else
				n + shift.to_i
			end
		 	 
		else
			n
		end

	end

	shiftedArray.map { |r| r.chr }.join
end

puts caesar_cipher("What a string!", 5)