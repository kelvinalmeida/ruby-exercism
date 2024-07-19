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

    array = numbers.split(" ")
    puts array
    
    # debug "The value is #{numbers}."

    numbers.chars.each do |digit|

      puts array

      # if(digit.to_i == 0 )
      #   raise ArgumentError.new
      # end
      
      # array.push(digit.to_i)
    end  
  end

  def self.numeric?(lookAhead)
    lookAhead =~ /[0-9]/
  end

end
