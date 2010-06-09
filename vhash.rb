require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'fiosv',
  :username => 'oneman',
  :password => 'funworld',
  :host => 'localhost',
  :port => '5432'
)

#ActiveRecord::Base.logger = Logger.new(STDERR)

def dec2hex(number)
   number = Integer(number.to_i);
   hex_digit = "0123456789ABCDEF".split(//);
   ret_hex = '';
   while(number != 0)
      ret_hex = String(hex_digit[number % 16 ] ) + ret_hex;
      number = number / 16;
   end
   return ret_hex; ## Returning HEX
end

class Vhash < ActiveRecord::Base
set_table_name "vhashes"

def show
 puts "input: #{self.input} ouput: #{self.output}"
end

def hash
 output
end


end

def find_by_time(time)

 hours,minutes,seconds = time.split(":")

 if minutes.length < 2
  minutes = "0" + minutes.to_s
 end

 if hours.length < 2
  hours = "0" + hours.to_s
 end

 if seconds.length < 2
  seconds = "0" + seconds.to_s
 end

 if hours.to_s == "0"
     hours = "00"
 end

 if seconds.to_s == "0"
     seconds = "00"
 end

 if minutes.to_s == "0"
     minutes = "00"
 end
 puts "converting 00#{hours}#{minutes}#{seconds} to hex"
 hours = dec2hex(hours)
 minutes = dec2hex(minutes)
 seconds = dec2hex(seconds)

 if minutes.length < 2
  minutes = "0" + minutes.to_s
 end

 if hours.length < 2
  hours = "0" + hours.to_s
 end

 if seconds.length < 2
  seconds = "0" + seconds.to_s
 end

 if hours.to_s == "0"
     hours = "00"
 end

 if seconds.to_s == "0"
     seconds = "00"
 end

 if minutes.to_s == "0"
     minutes = "00"
 end

 puts "searching for 00#{hours}#{minutes}#{seconds}"
 result = Vhash.find_by_input("00#{hours}#{minutes}#{seconds}")
 if result != nil
  puts "found hash for time #{result.hash}"
  return result
 else
   puts "oh no couldnt find!"
   Kernel.exit
 end

end

v1 = Vhash.find(:first)
v1.show
puts v1.hash

v2 = find_by_time("2:35:36")

x = Time.parse("01/01/1970")
86400.times do 
x = x + 1.second
vhash = find_by_time(x.strftime("%H:%M:%S"))

end
v2.show

puts "--------"

v3 = Vhash.find_by_output("62 75 11 73 f6 5c b5 d2 71 62 ef b7 54 be 8c ef 09 e2 86 67".gsub(" ", ""))
if v3 != nil
 v3.show
end

v4 = Vhash.find_by_output("70 01 c2 04 fe 08 50 6b 80 21 37 18 84 a7 6f c2 7e ca 6d 9c".gsub(" ", ""))
if v4 != nil
 v4.show
end

