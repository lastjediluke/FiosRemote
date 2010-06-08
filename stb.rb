# STB CLONEA

require 'socket'      # Sockets are in standard library

$control_code = ARGV.shift
$control_code = $control_code.split(" ")
puts "control code is " + $control_code.join(" ")

def construct_fios_stb_packet_stb_first()

# i am stb packet

#0000   56 02 02 01 00 04 00 00 00 00 00 00 00 00 00 00  V...............
#0010   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
#0020   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
#0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
#0040   00 00 00 00 00 72                                .....r

first_packet = %w{56 02 02 01 00 04 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 72}

return first_packet

end


def construct_fios_stb_packet_stb_second()

# i am stb number whatever w/ damn fuckin code

#0000   12 00 01 02 01 00 05 53 54 42 31 00 04 00 01 01  .......STB1.....
#0010   05 00 04 39 37 13 4d 06 00 04 00 00 00 14 07 00  ...97.M.........
#0020   20 48 9f 19 9f 93 73 ad 73 9a 0e 1b 9c 20 ba 39   H....s.s.... .9
#0030   eb 94 0e 01 5f 00 00 00 00 00 00 00 00 00 00 00  ...._...........
#0040   00 0b 00 04 01 0c 00 02 c0 00 0d 00 04 c0 00 00  ................
#0050   00 0e 00 04 c0 00 00 00 0f 00 06 c0 00 00 00 00  ................
#0060   06 10 00 04 c0 00 00 00 11 00 04 00 00 64 00 00  .............d..
#0070   00 00   

                                                 # changed
second_packet = %w{12 00 01 02 01 00 05 53 54 42 31 00 04 00 01 01
05 00 04 39 37 13 4d 06 00 04 00 00 00 14 07 00
20} + $control_code + %w{00 00 00 00 00 00 00 00 00 00 00
00 0b 00 04 01 0c 00 02 c0 00 0d 00 04 c0 00 00
00 0e 00 04 c0 00 00 00 0f 00 06 c0 00 00 00 00
06 10 00 04 c0 00 00 00 11 00 04 00 00 64 00 00
00 00}
puts 
return second_packet

end
                                
def construct_fios_remote_packet_yay()


#newtime()
yay_payload = %w{56 02 02 01 00 19 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
00 00 00 00 00 00}

return yay_payload

end


puts [construct_fios_stb_packet_stb_second().join ''].pack('H*')



hostname = '192.168.1.2'
port = 4532

sock = TCPSocket.open(hostname, port)


 puts "Expecting init packet / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end

 puts "sending stb first packet"
 sock.write [construct_fios_stb_packet_stb_first().join ''].pack('H*')
# puts "Expecting init packet / printing response"
# data = sock.recvfrom( 2220 )[0].chomp
# if data
#  puts data.unpack("H*")
# end
 puts "sending stb second packet"
 sock.write [construct_fios_stb_packet_stb_second().join ''].pack('H*')


puts [construct_fios_stb_packet_stb_second().join ''].pack('H*')


puts "Entering loop state"
while true
 puts "Looped"

 puts "Expecting / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end


 puts "Expecting / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end


 puts "Expecting / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end


 puts "Expecting / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end


 puts "Expecting / printing response"
 data = sock.recvfrom( 2220 )[0].chomp
 if data
  puts data.unpack("H*")
 end


 puts "sending yay packet"
 sock.write [construct_fios_remote_packet_yay().join ''].pack('H*')


 sleep 2

end


#s.close 