# encoding: utf-8

$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__)))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__),'models'))

require 'fox16'

include Fox

require 'active_record'

require 'pc_stack'
require 'pc_scroll_window'
require 'pc_footer'

#    models
#require 'computer_log'
#require 'computer'

class PcClub < FXMainWindow

    def initialize(app)
        super(app, "PcClub", :width => 610, :height => 400)


        main = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)

        scroll = PcScrollWindow.new main

        #:TODO remove tests
        (1..13).each do
           scroll.pc_stack.add_pc
        end

        pc_footer = PcFooter.new(main)

    end


    def create
        super
        show(PLACEMENT_SCREEN)
    end

end

#require 'gserver'

#class PcServer < GServer

    ##TODO порт должен коденфигурироватся пользователем а не жестко прописыватся в коде
    #PORT = 1488

    #HOST = 'localhost'

    #server = TCPServer.open(HOST, PORT)   # Socket to listen on port 2000
    #loop do                        # Servers run forever
        #Thread.start(server.accept) do |client|
            #client.puts(Time.now.ctime) # Send the time to the client
            #client.puts "Closing the connection. Bye!"
            #client.close                # Disconnect from the client
        #end
    #end
#end

class PreferencesDialog < FXDialogBox
    def initialize(owner)
        super(owner, "Preferences" , DECOR_ALL, :width => 500 , :height => 300)

        on_init
    end

    def on_init
        table = FXTable.new(self, :opts => LAYOUT_FILL)
        table.setTableSize(10, 10)
    end
end

class Clock < FXLabel

    def initialize(parent)
        t = Time.now
        super(parent, t.strftime('%H:%M'), :opts => JUSTIFY_RIGHT|JUSTIFY_BOTTOM)
    end


end




if __FILE__ == $0
    FXApp.new do |app|
        main_window = PcClub.new(app)
        app.create
        app.run
    end
end

