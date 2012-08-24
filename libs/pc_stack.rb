#require File.expand_path(File.join(File.dirname(__FILE__), 'client_pc'))
require 'client_pc'
class PcStack < FXMatrix


    def initialize (parent)
        super(parent, :opts => LAYOUT_FILL|MATRIX_BY_COLUMNS)

    end

    def layout
       self.numColumns = [width/ClientPC::WIDTH, 1].max
       super
    end

    def add_pc
        ClientPC.new(self)
    end
end
