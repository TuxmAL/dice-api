# Ruby: get local IP (nix)
# from http://stackoverflow.com/questions/5029427/ruby-get-local-ip-nix
# answer: http://stackoverflow.com/a/7809304/11594 
require 'socket'

def my_first_private_ipv4
  Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
end

def my_first_public_ipv4
  Socket.ip_address_list.detect{|intf| intf.ipv4? and !intf.ipv4_loopback? and !intf.ipv4_multicast? and !intf.ipv4_private?}
end

