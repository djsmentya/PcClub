# encoding: utf-8

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


class Clock < FXLabel

    def initialize(parent)
        t = Time.now
        super(parent, t.strftime('%H:%M'), :opts => JUSTIFY_RIGHT|JUSTIFY_BOTTOM)
    end

end



