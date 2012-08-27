class PcScrollWindow < FXScrollWindow
    attr_reader :pc_stack
    def initialize(parent)
        super(parent, :opts => LAYOUT_FILL|HSCROLLING_OFF)

        on_init
    end


    def on_init
        @pc_stack = PcStack.new(self)
    end


    def layout

        @pc_stack.width = width

        @pc_stack.layout
        super
    end
end
