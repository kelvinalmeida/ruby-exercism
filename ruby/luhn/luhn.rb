=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

module Luhn 
  def self.valid?(numbers)

    numbers.strip!
    
    if(numbers.length <= 1)
      return false
    end

    array_of_numbers = numbers.split(" ").join.chars.reverse

    array_of_numbers.each do |char|
      print "\n#{char}\n"
      if letter?(char)
        return false
      end
    end

    array_of_numbers = array_of_numbers.each_with_index.map { |num, idx| ((idx + 1) % 2) == 0 ? double_number(num.to_i): num.to_i }

    num_sum = array_of_numbers.sum

    if(num_sum % 10 == 0)
      print "3 - #{num_sum % 10}\n"
      return true
    else
      print "4 - #{num_sum % 10}\n"
      return false
    end
  end

  def self.double_number(num)
    num_d = num.to_i * 2

    if(num_d > 9)
      return (num_d - 9)
    else
      return num_d
    end
  end


  # checks if it is a letter or a special character
  def self.letter?(lookAhead)
    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    lookAhead =~ /[A-Za-z]/ || lookAhead =~ /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  end

end
