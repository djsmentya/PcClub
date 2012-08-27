# encoding: utf-8

$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__)))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__),'models'))

require 'fox16'
require 'eventmachine'
include Fox

require 'active_record'

require 'pc_stack'
require 'pc_scroll_window'
require 'pc_footer'
require 'pc_server'


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
        @thread = Thread.new do
            puts ' Thread serer'
            EventMachine::run {
                EventMachine::start_server "127.0.0.1", 8081, PcServer
                puts 'running echo server on 8081'
            }
        end
        show(PLACEMENT_SCREEN)
    end

    def onDestroy
        EventMachine::stop_server
        super

    end

end


class Clock < FXLabel

    def initialize(parent)
        t = Time.now
        super(parent, t.strftime('%H:%M'), :opts => JUSTIFY_RIGHT|JUSTIFY_BOTTOM)
    end

end


#@threads = []

#@threads << Thread.new do

    if __FILE__ == $0
        FXApp.new do |app|
            main_window = PcClub.new(app)
            app.create
            app.run
        end
    end
#end

#@threads << Thread.new do
    #puts ' Thread serer'
    #EventMachine::run {
        #EventMachine::start_server "127.0.0.1", 8081, PcServer
        #puts 'running echo server on 8081'
    #}
#end

#@threads.each { |element| element.join }
