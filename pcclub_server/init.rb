$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'libs'))

require 'fox16'
require 'eventmachine'
#require 'active_record'
include Fox

require 'pcclub'
require 'server/pc_server'
#begin
# your script here



EM.run do
    
    EM.start_server('0.0.0.0', 3000, PcServer )
    puts 'Server started at 3000 port'
    start_gui = Proc.new do
        if __FILE__ == $0
            FXApp.new do |app|
                main_window = PcClub.new(app)
                app.create
                app.run
            end
        end
    end

    stop_s = Proc.new do
        EM.stop
    end

    EM.defer(start_gui, stop_s)
end
    #rescue Exception => e
    #File.open("except.log") do |f|
    #f.puts e.inspect
    #f.puts e.backtrace
    #end
    #end

