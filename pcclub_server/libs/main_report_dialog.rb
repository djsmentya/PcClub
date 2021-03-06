class MainReportDialog < FXDialogBox
  # To change this template use File | Settings | File Templates.

    def initialize(owner)
        super(owner, "Preferences" , DECOR_ALL, :width => 500 , :height => 300, :x => 50, :y =>50)

        on_init
    end

    def on_init

        page_layout = FXVerticalFrame.new(self, :opts => LAYOUT_FILL)

        table = FXTable.new(page_layout, :opts => LAYOUT_FILL)
        table.setTableSize(10, 10)

        btn_layout = FXHorizontalFrame.new(page_layout, :opts => LAYOUT_FILL_X)
        button_close = FXButton.new(btn_layout, "Close",:opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)
        button_color = FXButton.new(btn_layout, "Change the color for background", :opts =>FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)
        button_print = FXButton.new(btn_layout, "Print", :opts => FRAME_RAISED|FRAME_THICK|LAYOUT_FILL)

        button_close.connect(SEL_COMMAND) do |sender, sel, event|
          close
        end

        button_color.connect(SEL_COMMAND) do |sender, sel, event|
          dialog = FXColorDialog.new(self, "Choose Background color")
          dialog.rgba = FXRGB(255, 0, 0)
          if dialog.execute != 0
            self.backColor=dialog.rgba
          end
        end

        button_print.connect(SEL_COMMAND) do |sender, sel, event|
          printer = FXPrintDialog.new(self, "Choose a print settings", :x => 50, :y => 50)
          printer.create
          printer.show
        end
    end

end

