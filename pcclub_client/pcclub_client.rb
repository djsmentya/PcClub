require 'eventmachine'

class Echo < EventMachine::Connection
    include EM::P::ObjectProtocol
    def post_init
        puts 'posting...'
        send_object([456,65,48,98,5,654,465,46,46,54,6544,64,64,65,4])
        puts 'posted'
    end

    def receive_object obj
        p obj.inspect
    end
end

EventMachine.run {
    EventMachine.connect'127.0.0.1', 3000, Echo
}


class Poo
require 'socket'
require 'timeout'
def port_open?(ip, port, seconds=1)
  Timeout::timeout(seconds) do
    begin
      TCPSocket.new(ip, port).close
      true
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      false
    end
  end
rescue Timeout::Error
  false
end
end
