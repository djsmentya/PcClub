
class ClientPC < FXVerticalFrame

    WIDTH = 100

    def initialize(parent)
        super(parent, :width => WIDTH)
        on_init

    end

    def on_init

        groupbox = FXGroupBox.new(self, nil, :opts => GROUPBOX_NORMAL|FRAME_GROOVE)
        @label = FXLabel.new(groupbox, "PC-1" , :opts => LAYOUT_FILL_X)
        @label.backColor = Fox.FXRGB(255,0,0)
        @label = FXLabel.new(groupbox, "FREE" , :opts => LAYOUT_FILL_X)

        @combobox = FXComboBox.new(groupbox, 9, nil, 0, COMBOBOX_INSERT_LAST|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP)
        @hframe = FXHorizontalFrame.new(groupbox)
        @btn = FXButton.new(@hframe, "Start", nil, nil, 0, FRAME_RAISED|FRAME_THICK)
        @btn2 = FXButton.new(@hframe, "Reset", nil, nil, 0, FRAME_RAISED|FRAME_THICK)


        @groupbox2 = FXGroupBox.new(groupbox, nil, :opts => GROUPBOX_NORMAL|FRAME_GROOVE|LAYOUT_FILL)
        @btn3 = FXButton.new(@groupbox2, "Statistica", nil, nil, 0, FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)

    end

end
