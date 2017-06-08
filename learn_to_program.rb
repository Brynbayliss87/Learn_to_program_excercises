def deaf_grandma
  #asks user to speak to Grandma 
  #Grandma can only understand uppercase
  #must say BYE to grandma 3 times to leave
  puts "Talk to Grandma."
  speech = gets.chomp
  counter = 0
  while counter < 2 do
    if speech != speech.upcase
      puts "What? Speak up sonny!"
      speech = gets.chomp
      counter = 0 
    elsif speech == "BYE"
      counter += 1 
      puts "Don't leave yet"
      speech = gets.chomp  
    else puts "Yes, but not since 193#{rand(10)}!"
      speech = gets.chomp
      counter = 0
    end
  end
  puts "See you then."
end

def leap_year(start, stop)
  #outputs leap years between a start and end year
  current = start
  while current <= stop
    if current % 400 ==0
      puts current
      current += 1
    elsif current % 4 ==0
      puts current
      current += 1
    else current += 1
    end
  end
end

def sorted_list
  #sorts a list of inputted values
  speech = " "
  input = []
  while speech != ""
    puts "What would you like to add?"
    speech = gets.chomp
    input << speech
  end
  puts input.sort
end

def no_sort_list
  #sorts a list of inputted values without using inbuilt sort function
  speech = " "
  input = []
  sorted_input = []
  while speech != ""
    puts "What would you like to add?"
    speech = gets.chomp
    input << speech
  end
  while input != []
    sorted_input << input.min
    input.delete(input.min)
  end
  puts sorted_input
end

def englishNumber number
  #returns a string in full english of an inputted integer 
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  # write and left... get it?  :)

 left = number

 write = left/1000000
  left = left - write * 1000000
  if write > 0
    millions = englishNumber write
    numString = numString + millions + ' million'
    if left > 0
      numString = numString + ' '
    end
  end
  
  number = left 
  write = left/1000
  left= left - write*1000
  if write > 0
    thousands = englishNumber write
    numString = numString + thousands + ' thousand'
    if left > 0
      numString = numString + ' '
    end
  end

  number = left
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0 
    # Now here's a really sly trick:
    thousands  = englishNumber write
    numString = numString + thousands + ' thousand'
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.
    
    
    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end


class Orange_tree

  def initialize 
    #initialize an Orange_tree instance
    @height = 0.5
    @age = 1
    @oranges = 0
  end

  def height
    #return string with height of tree
    puts @height
  end

  def one_year_passes
    #passes a year to the age of the tree
    #height of tree grows with age
    #after a tree reaches 2 it starts producing oranges
    #trees die when they reach 30
    @age += 1
    @height += 0.25
    @oranges = 0
    if @age > 2
      @oranges = @age*5
    end
    if @age > 30
      puts "The tree is so old it has died"
      exit
    end  
  end

  def count_the_oranges
    #outputs the number of oranges on the tree
    puts @oranges
  end

  def pick_an_orange
    #picks an orange off the tree
    if @oranges > 0
      @oranges -= 1
      puts "What a tasty orange!"
    else puts "There isn't any fruit!"
    end
  end

end

def grandfather_clock some_proc
  # calls the block for each hour of the current time 
  time = Time.now.hour
  if time == 0
    time =  12
  elsif time > 12
    time = time - 12
  else
    time =  time
  end
  time.times do some_proc.call
  end
end

time_now = Proc.new do
  puts "DONG!"
end

def log (description, block)
  #calls a block 
  #returns a description at start and end of block call with ouput of block
  puts " Beginning #{description}"
  output = block.call
  puts "Finished #{description} returns #{output}"
end

first_block = Proc.new do
  log("second block", second_block)
  

    second_block = Proc.new do
    1 != 2
    end
  5*5
  end

log("first block", first_block)
