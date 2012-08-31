class PcServer < EventMachine::Connection
    include EM::P::ObjectProtocol
    
    def post_init
        puts 'helllo'
    end

    def receive_object obj
        puts 'server requested'
        send_object({'you said' => obj})
    end

    def unbind
        puts 'goodby'
    end
end
